#' Find any alphanumeric snippet, signature or keyword in the web pages HTML, JS and CSS code in the PublicWWW database
#'
#' The API is _highly_ restrictive, even for paid plans, but even the free plan provides some
#' insight into the makeup of the top 3 million web sites.
#'
#' The API key can be provided at the time of calling, but it is recommended that
#' the caller store it in the `PUBLICWWW_API_KEY` environment variable
#' (a good place for that is `~/.Renviron`).
#'
#' @md
#' @param query query string
#' @param snippets if `TRUE` then include snippets in the download
#' @param pw_api_key PublicWWW API KEY
#' @references [PublicWWW home](https://publicwww.com/); [Query syntax](https://publicwww.com/syntax.html); [API Pricing](https://publicwww.com/pricing.html)
#' @return data frame (tibble)
#' @export
#' @examples
#' # Sites using the WordPress theme "Twenty Sixteen":
#' source_code_search('"/wp-content/themes/twentysixteen/"')
#'
#' # Sites running the coinhive JS miner:
#' source_code_search('"coin-hive.com/lib/coinhive.min.js"')
source_code_search <- function(query, snippets=FALSE, pw_api_key=Sys.getenv("PUBLICWWW_API_KEY")) {

  query <- URLencode(query, TRUE)

  httr::GET(
    url = sprintf("https://publicwww.com/websites/%s/", query),
    query = list(
      key = pw_api_key,
      export = if (snippets) "csvsnippets" else "csv"
    )
  ) -> res

  httr::stop_for_status(res)

  res <- httr::content(res, as="text")

  res <- read.csv(text=res, header=FALSE, sep=";", stringsAsFactors=FALSE)

  class(res) <- c("tbl_df", "tbl", "data.frame")

  colnames(res) <- if (snippets) c("site", "rank", "snippet") else c("site", "rank")

  res


}
