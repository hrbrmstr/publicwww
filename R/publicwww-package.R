#' Query the 'PublicWWW' Source Code Search Engine
#'
#' The 'PublicWWW' <https://publicwww.com/> source code search engine indexes the content
#' of over 200 million web sites and provides a query interface that lets the
#' caller find any alphanumeric snippet, signature or keyword in the web pages
#' 'HTML', 'JavaScript' and 'CSS' style sheet code.
#'
#' The API key can be provided at the time of calling, but it is recommended that
#' the caller store it in the `PUBLICWWW_API_KEY` environment variable
#' (a good place for that is `~/.Renviron`).
#'
#' @md
#' @name publicwww
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @note The site requires an [API key](https://publicwww.com/pricing.html) and has limited
#'       functionality under the free plan.
#' @import httr
NULL
