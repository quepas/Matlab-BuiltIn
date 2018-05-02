source("scrapeLatest.R")
source("scrapeWebpageFromR2012b.R")
source("scrapeWebpageFromR2011a.R")

# Scrape latest version
scrapeLatest()
# Scrape from downloaded webpages (from R2012b to R2018a)
# The documentation for these versions is regular, there are no errors in the data.
scrapeWebpageFromR2012b("R2018a")
scrapeWebpageFromR2012b("R2017b")
scrapeWebpageFromR2012b("R2017a")
scrapeWebpageFromR2012b("R2016b")
scrapeWebpageFromR2012b("R2016a")
scrapeWebpageFromR2012b("R2015b")
scrapeWebpageFromR2012b("R2015a")
scrapeWebpageFromR2012b("R2014b")
scrapeWebpageFromR2012b("R2014a")
scrapeWebpageFromR2012b("R2013b")
scrapeWebpageFromR2012b("R2013a")
scrapeWebpageFromR2012b("R2012b")
# For versions belowe R2012b:
#   Documentation web template is irregular, thus the quality of data is low.
#   For example, there are plenty of mistakes in the built-ins names.
scrapeWebpageFromR2011a("R2012a")
scrapeWebpageFromR2011a("R2011b")
scrapeWebpageFromR2011a("R2011a")
