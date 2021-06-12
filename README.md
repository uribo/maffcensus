
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

### 農業集落境界データ

[農業集落境界データ](https://www.maff.go.jp/j/tokei/census/shuraku_data/2015/ma/index.html)
2015, 2010年のShapefile形式のデータをsfオブジェクトとして読み込みます。

``` r
read_rcom("MA0001_2015_2015_44/rcom.shp")
```

### わがマチ・わがムラ統計データ

[わがマチ・わがムラ](http://www.machimura.maff.go.jp/machi/index.html)
のページからダウンロードした市町村別の統計データに対して

-   読み込み
-   項目の絞り込み
-   データ整形

の処理をおこなう関数を提供します。

``` r
d <- 
  read_machimura("details_data.csv")
d
```

``` r
d %>% 
  machimura_filter_area(city_only = TRUE)
```
