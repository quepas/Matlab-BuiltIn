library(rvest)

mf <- read_html("http://www.mathworks.com/help/matlab/functionlist-alpha.html")
mf <- mf %>% 
      html_nodes('table td a') %>% 
      html_text()

# remove keywords (iskeyword() in MATLAB)
mkeywords <- read.csv('data/MATLAB_keywords.txt')
mf <- exclude(mf, mkeywords$keywords)

# remove entries with multiple names (they are keywords in all cases)
multiple <- mf[grep(',', mf)]
mf <- exclude(mf, multiple)
# remove section names
sections <- mf[grep(' ', mf)]
mf <- exclude(mf, sections)
# remove 

# save as one column CSV file
