
# publicwww

Query the ‘PublicWWW’ Source Code Search Engine

## Description

The ‘PublicWWW’ <https://publicwww.com/> source code search engine
indexes the content of over 200 million web sites and provides a query
interface that lets the caller find any alphanumeric snippet, signature
or keyword in the web pages ‘HTML’, ‘JavaScript’ and ‘CSS’ style sheet
code.

## NOTE

The site requires an [API key](https://publicwww.com/pricing.html) and
has limited functionality under the free plan.

## What’s Inside The Tin

The following functions are implemented:

## Installation

``` r
devtools::install_github("hrbrmstr/publicwww")
```

## Usage

``` r
library(publicwww)
library(tidyverse)

# current verison
packageVersion("publicwww")
```

    ## [1] '0.1.0'

### Sites using the WordPress theme “Twenty Sixteen”:

``` r
source_code_search('"/wp-content/themes/twentysixteen/"')
```

    ## No encoding supplied: defaulting to UTF-8.

    ## # A tibble: 2,847 x 2
    ##    site                          rank
    ##    <chr>                        <int>
    ##  1 cyberciti.biz                 4738
    ##  2 creativecommons.org           7217
    ##  3 1337x.io                      8173
    ##  4 bestgore.com                  8480
    ##  5 mooma.sh                     23268
    ##  6 educationteams.com           30091
    ##  7 stih.su                      33197
    ##  8 getitfree.us                 37142
    ##  9 pagesuite-professional.co.uk 39135
    ## 10 tagaloglang.com              40384
    ## # ... with 2,837 more rows

### Sites running the coinhive JS miner

``` r
source_code_search('"coin-hive.com/lib/coinhive.min.js"')
```

    ## No encoding supplied: defaulting to UTF-8.

    ## # A tibble: 501 x 2
    ##    site                 rank
    ##    <chr>               <int>
    ##  1 seriesdanko.to       9955
    ##  2 porn68jav.com       16931
    ##  3 wifi4games.com      21058
    ##  4 xyya.net            41457
    ##  5 dazabo.com          46003
    ##  6 series-cravings.tv  53648
    ##  7 rroij.com           76319
    ##  8 katzddl.ws          95124
    ##  9 pornfromcz.com     102247
    ## 10 uinsgd.ac.id       102894
    ## # ... with 491 more rows

### Sites (theoretically) running Drupal

``` r
source_code_search('"/sites/all/themes/"', snippets = TRUE)
```

    ## No encoding supplied: defaulting to UTF-8.

    ## Warning in scan(file = file, what = what, sep = sep, quote = quote, dec = dec, : EOF within quoted string

    ## # A tibble: 11 x 3
    ##    site                 rank snippet                                                                                   
    ##    <chr>               <int> <chr>                                                                                     
    ##  1 nih.gov               136 "\\https://www.nih.gov/sites/all/themes/nih/apple-touch-icon\nweather.com;244;\\https://w…
    ##  2 okta.com              403 "https://www.okta.com/sites/all/themes/Okta/favicon.ico\\ ty\npatch.com;465;rel=\\preload…
    ##  3 thehill.com           636 "=\\TheHill.com\\ src=\\/sites/all/themes/thehill/images/redes\nharvard.edu;702;e=\\image…
    ##  4 psu.edu               837 "\\http://www.psu.edu/sites/default/files/css/c...ion/rss+xml\\ title=\\All News\\ href=\…
    ##  5 nasa.gov              868 "e-touch-icon\\ href=\\/sites/all/themes/custom/nasatwo/image"                            
    ##  6 edx.org               973 "\\https://www.edx.org/sites/all/themes/adaptivetheme/at_cor\nspacex.com;1024;ttp://www.s…
    ##  7 tesla.com            1207 "sizes=\\57x57\\ href=\\/sites/all/themes/custom/tesla_theme/a\nnbcsports.com;1225;03k\\ …
    ##  8 elmogaz.com          1433 "tp://www.elmogaz.com/sites/all/themes/elmogaz/favicon.ico\\\ncaf.fr;1518;hortcut icon\\ …
    ##  9 psychologytoday.com  1526 .psychologytoday.com/sites/all/themes/psychologytoday/img/                                
    ## 10 colorado.edu         1589 s://www.colorado.edu/sites/all/themes/homepage2017_theme/f                                
    ## 11 collegeboard.org     1714 "IE 9]> <script src=\\/sites/all/themes/uwe_theme/js/libs/ht\n\n"
