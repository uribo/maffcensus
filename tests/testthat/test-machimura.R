test_that("multiplication works", {
  expect_equal(build_machimura_url(city_code = "08201", type = "detail"),
               "http://www.machimura.maff.go.jp/machi/contents/08/201/details.html")
  expect_equal(build_machimura_url(city_code = "33100", type = "base"),
               "http://www.machimura.maff.go.jp/machi/contents/33/100/index.html")
})
