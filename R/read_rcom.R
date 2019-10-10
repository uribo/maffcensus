#' Read agricultural district
#'
#' @param path path to shapefile.
#' @details Convert Coordinate Reference System EPSG:4612 (JGD2000) to EPSG:6668 (JGD2011).
#' To standardize all character variables Unicode NFKC with [stringi::stri_trans_nfkc][stringi::stri_trans_nfkc].
#' @seealso \url{http://www.maff.go.jp/j/tokei/census/shuraku_data/2015/ma/index.html}
#' @return A [sf][sf::st_sf]
#' @export
read_rcom <- function(path) {
  d <- sf::st_read(path,
              stringsAsFactors = FALSE,
              as_tibble = TRUE)
  sf::st_crs(d) <- 6668
  d %>%
    purrr::set_names(tolower(names(d))) %>%
    purrr::modify_if(is.character,
                     ~ stringi::stri_trans_nfkc(.x))
}
