.read_machimura_raw <- function(path) {
  prefecture_name <- city_name <- NULL
  vars <-
    readr::read_lines(path,
                      n_max = 1,
                      locale = readr::locale(encoding = "cp932")) %>%
    stringr::str_split(",", simplify = TRUE)
  readr::read_csv(path,
                  locale = readr::locale(encoding = "cp932"),
                  col_names = c(vars[1:3],
                                "都道府県",
                                "都道府県_単位",
                                "市町村",
                                "市町村_単位"),
                  col_types = "ccccccc") %>%
    dplyr::slice(-1L) %>%
    dplyr::mutate(
      prefecture_name = vars[4],
      city_name = vars[6]) %>%
    dplyr::relocate(prefecture_name,
                    city_name,
                    .before = 1)
}

machimura_notes <- function(x) {
  dplyr::case_when(
    x == "-" ~ "事実のないもの",
    x == "\u2026" ~ "事実不詳または調査を欠くもの",
    x == "X" ~ "秘密保護上統計数値を公表しないもの")
}

#' Read Waga Machi Waga Mura csv file
#' @param path path to csv
#' @export
#' @rdname read_machimura
read_machimura <- function(path) {
  .read_machimura_raw(path) %>%
    dplyr::mutate(dplyr::across(.cols = c(5, 6, 8),
                                .fns = ~ machimura_notes(.x),
                                .names = "{.col}_note")) %>%
    dplyr::mutate(dplyr::across(.cols = c(5, 6, 8),
                                .fns = ~ stringr::str_replace_all(.x,
                                                                  "(-|\u2026|X)",
                                                                  NA_character_))) %>%
    dplyr::mutate(`項目名` = stringr::str_remove(`項目名`, "　$")) %>%
    readr::type_convert(col_types = "ccciddcdcccc")
}
