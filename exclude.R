# exclude data in exclude_list from base data
exclude <- function(base, exclude_list) {
  base[!(base %in% exclude_list)]
}
