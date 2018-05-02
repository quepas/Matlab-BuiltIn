library(rvest)
library(stringr)

scrapeLatest <- function(url = "http://www.mathworks.com/help/matlab/functionlist-alpha.html", version="latest") {
  html <- read_html(url)
  functions <- html %>%
    html_nodes(xpath="//table//tr//td[1]") %>%
    html_text()
  descriptions <- html %>%
    html_nodes(xpath="//table//tr//td[2]") %>%
    html_text() %>%
    str_replace("[\n\t]", "") %>%
    str_squish()

  mf <- data.frame(func=functions, desc=descriptions)
  write.csv(mf, sprintf("builtins/%s.csv", version), row.names=F, quote=T)
}