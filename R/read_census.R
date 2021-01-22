#' Read census keieitai file
#' @param path file
#' @param data.table Return data class.
#' @export
#' @import data.table
#' @rdname read_census
read_census_keieitai <- function(path, data.table = TRUE) {
  city_code <- NULL
  fix_names <-
    c(
      c("pref_code", "city_code", "city_code_stale",
        "rcom", "survey_area", "kyakutai",
        "city", "city_stale", "community", "zip_code"),
      paste0("Q",
             c(seq_len(4),
               seq.int(13, 18),
               20,
               seq.int(101, 103),
               seq.int(201, 204))),
      paste0(
        rep(paste0("Q",
                   seq.int(0, 15),
                   "X"), each = 11),
        rep(c(seq_len(2),
              seq.int(31, 33),
              seq.int(4, 6),
              seq.int(71, 73)), times = 16)
      ),
      paste0("Q",
             seq.int(205, 207)),
      paste0("Q",
             c(
               seq.int(301, 316),
               seq.int(323, 336),
               seq.int(343, 346),
               seq.int(406, 410),
               seq.int(412, 421),
               seq.int(423, 431),
               seq.int(441, 442),
               seq.int(451, 453),
               seq.int(502, 503),
               seq.int(505, 506),
               seq.int(508, 509),
               seq.int(511, 513),
               seq.int(515, 517),
               seq.int(519, 524),
               seq.int(534, 571),
               seq.int(604, 635),
               seq.int(644, 651),
               seq.int(653, 654),
               seq.int(662, 663),
               seq.int(665, 671),
               seq.int(673, 679),
               seq.int(701, 709),
               seq.int(711, 734),
               seq.int(801, 843),
               seq.int(851, 858),
               seq.int(861, 864),
               seq.int(871, 878),
               seq.int(881, 888))),
      "Z10", "X06",
      "X07", "M02")
  dd <-
    data.table::fread(file = path,
                      colClasses = list(character = seq_len(10),
                                        double = seq(11, 482)),
                      col.names = fix_names,
                      na.strings = "")
  dd[, city_code := stringr::str_pad(as.character(city_code), width = 3, pad = "0")]
  if (data.table == FALSE) {
    dd %>%
      tibble::as_tibble()
  }
}
