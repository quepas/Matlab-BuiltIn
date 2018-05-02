library(rvest)
library(stringr)

scrapeWebpageFromR2012b <- function(version) {
  html <-read_html(sprintf("webpages/%s.html", version))
  functions <- html %>%
    html_nodes(xpath="//table//tr//td[contains(@class, 'term')]") %>%
    html_text()
  descriptions <- html %>%
    html_nodes(xpath="//table//tr//td[contains(@class, 'description')]") %>%
    html_text() %>%
    str_replace("[\n\t]", "") %>%
    str_squish()

  mf <- data.frame(func=functions, desc=descriptions)
  write.csv(mf, sprintf("builtins/%s.csv", version), row.names=F, quote=T)
}