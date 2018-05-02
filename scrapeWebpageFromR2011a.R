library(rvest)
library(stringr)

scrapeWebpageFromR2011a <- function(version) {
  html <-read_html(sprintf("webpages/%s.html", version))
  functions <- html %>%
    html_nodes(xpath="//table//tr//td[@valign]") %>%
    html_text() %>%
    str_replace("[\n\t]", "") %>%
    str_squish()
  functions <- functions[8:length(functions)]
  descriptions <- html %>%
    html_nodes(xpath="//table//tr//td[2]") %>%
    html_text() %>%
    str_replace("[\n\t]", "") %>%
    str_squish()
  descriptions <- descriptions[12:length(descriptions)]
  descriptions <- descriptions[1:(length(descriptions)-2)]

  mf <- data.frame(func=functions, desc=descriptions)
  write.csv(mf, sprintf("builtins/%s.csv", version), row.names=F, quote=T)
}