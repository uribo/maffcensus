#' View Waga Machi Waga Mura page
#' @param city_code city code
#' @param type "basic" or "detail"
#' @examples
#' \dontrun{
#' build_machimura("08201", type = "base")
#' }
#' @export
view_machimura <- function(city_code, type) {
  utils::browseURL(
    build_machimura_url(city_code, type)
  )
}

select_city_only <- function(data) {
  # data %>%
  #   dplyr::select(city_code, city_name, nen, koumoku, contains("city"))
  data %>%
    dplyr::select(prefecture_name,
                  city_name,
                  `項目名`,
                  `年`,
                  tidyselect::contains("市町村"))
}

machimura_filter_area <- function(data, city_only = TRUE) {
  data <-
    data %>%
    dplyr::filter(`項目名` %in% c("総土地面積",
                                 "林野面積",
                                 "耕地面積", "田耕地面積", "畑耕地面積")) %>%
    dplyr::mutate(`項目名` = dplyr::if_else(`項目名` %in% c("田耕地面積", "畑耕地面積"),
                                    paste0("耕地面積うち_", `項目名`),
                                    `項目名`))
  if (city_only == TRUE) {
    data <-
      select_city_only(data)
  }
  data
}

machimura_filter_population <- function(data, city_only = TRUE) {
  data <-
    data %>%
    dplyr::filter(`項目名` %in% c("総人口", "人口・男", "人口・女",
                                 "年少人口", "生産年齢人口", "老年人口",
                                 "農業就業人口", "農業就業人口・男", "農業就業人口・女",
                                 "漁業就業者数", "漁業就業者数・男", "漁業就業者数・女",
                                 "総世帯数"))
  if (city_only == TRUE) {
    data <-
      select_city_only(data)
  }
  data
}

machimura_filter_finance <- function(data, city_only = TRUE) {
  data <-
    data %>%
    dplyr::filter(`項目名` %in% c("歳入総額", "歳出総額", "農・畜産業費", "林業費",
                                 "水産業費")) %>%
    dplyr::mutate(`項目名` = dplyr::if_else(`項目名` %in% c("農・畜産業費", "林業費", "水産業費"),
                                    paste0("歳出総額うち_", `項目名`),
                                    `項目名`))
  if (city_only == TRUE) {
    data <-
      select_city_only(data)
  }
  data
}

machimura_filter_office <- function(data, city_only = TRUE) {
  data <-
    data %>%
    dplyr::filter(`項目名` %in% c("事業所数総数", "建設業事業所数",
                                 "製造業事業所数", "食品製造業事業所数", "卸売業・小売業事業所数")) %>%
    dplyr::mutate(`項目名` = dplyr::if_else(`項目名` %in% c("食品製造業事業所数"),
                                    paste0("製造業事業所数うち_", `項目名`),
                                    `項目名`))
  if (city_only == TRUE) {
    data <-
      select_city_only(data)
  }
  data
}

machimura_filter_farmer <- function(data, city_only = TRUE) {
  data <-
    data %>%
    dplyr::filter(`項目名` %in% c("農業経営体数", "農業経営体・家族経営体数",
                                 "家族経営体数・うち法人経営体数", "農業経営体・組織経営体数",
                                 "組織経営体数・うち法人経営体数", "総農家数",
                                 "自給的農家数", "販売農家数", "主業農家数", "準主業農家数",
                                 "副業的農家数", "専業農家数", "第１種兼業農家数",
                                 "第２種兼業農家数"))
  if (city_only == TRUE) {
    data <-
      select_city_only(data)
  }
  data
}

machimura_filter_gyosyugyokaku <- function(data, city_only = TRUE) {
  data <-
    data %>%
    dplyr::filter(`項目名` %in% c("魚種別漁獲量・かじき類", "魚種別漁獲量・かつお類",
                                 "魚種別漁獲量・さめ類", "魚種別漁獲量・さけ・ます類",
                                 "魚種別漁獲量・このしろ", "魚種別漁獲量・にしん",
                                 "魚種別漁獲量・いわし類", "魚種別漁獲量・あじ類",
                                 "魚種別漁獲量・さば類", "魚種別漁獲量・さんま",
                                 "魚種別漁獲量・ぶり類", "魚種別漁獲量・ひらめ・かれい類",
                                 "魚種別漁獲量・たら類", "魚種別漁獲量・ほっけ",
                                 "魚種別漁獲量・きちじ", "魚種別漁獲量・はたはた",
                                 "魚種別漁獲量・にぎす類", "魚種別漁獲量・あなご類",
                                 "魚種別漁獲量・たちうお", "魚種別漁獲量・たい類",
                                 "魚種別漁獲量・いさき", "魚種別漁獲量・さわら類",
                                 "魚種別漁獲量・すずき類", "魚種別漁獲量・いかなご",
                                 "魚種別漁獲量・あまだい類", "魚種別漁獲量・ふぐ類",
                                 "魚種別漁獲量・えび類", "魚種別漁獲量・かに類",
                                 "魚種別漁獲量・おきあみ類", "魚種別漁獲量・貝類",
                                 "魚種別漁獲量・いか類", "魚種別漁獲量・たこ類",
                                 "魚種別漁獲量・うに類", "魚種別漁獲量・海産ほ乳類",
                                 "魚種別漁獲量・海藻類")) %>%
    dplyr::mutate(`項目名` = stringr::str_remove(`項目名`, "魚種別漁獲量・"))
  if (city_only == TRUE) {
    data <-
      select_city_only(data)
  }
  data
}

build_machimura_url <- function(city_code, type) {
  type <-
    rlang::arg_match(type,
                     c("base", "detail"))
  pref <-
    stringr::str_sub(city_code, 1, 2)
  city <-
    stringr::str_sub(city_code, 3, 5)
  ifelse(type == "base",
         glue::glue("http://www.machimura.maff.go.jp/machi/contents/{pref}/{city}/index.html"),
         glue::glue("http://www.machimura.maff.go.jp/machi/contents/{pref}/{city}/details.html"))
}
