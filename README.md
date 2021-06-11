
<!-- README.md is generated from README.Rmd. Please edit that file -->

# maffcensus

<!-- badges: start -->
<!-- badges: end -->

**maffcensus**は[農林水産省](https://www.maff.go.jp/)が取り扱う各種のオープンデータ等をRで処理しやすくするためのパッケージです。

## インストール

パッケージを利用するには[GitHub](https://github.com/)からインストールを行う必要があります。次のコマンドをRで実行することでインストールが行われます。

``` r
if (!requireNamespace("remotes"))
  install.packages("remotes")

remotes::install_github("uribo/maffcensus")
```

## 利用例

``` r
library(maffcensus)
```

-   [x] 農林業センサス `read_census_keieitai()`
-   [x] 農業集落境界データ `read_rcom()`
-   [x] わがマチ・わがムラ (グラフで見る農林水産業) `read_machimura()`
