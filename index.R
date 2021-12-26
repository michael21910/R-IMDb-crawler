# example -> crawling avengers: infinity war

# install rvest package if you haven't
# install.packages("rvest")
# install.packages("stringi")

library(rvest)

name_url <- "https://www.imdb.com/title/tt4154756/"
score_url <- "https://www.imdb.com/title/tt4154756/ratings/?ref_=tt_ov_rt"

# crawling avengers: infinity war
score_content <- read_html(score_url)
name_content <- read_html(name_url)

# name of this movie
name <- html_nodes(name_content, ".OriginalTitle__OriginalTitleText-jz9bzr-0")

# score of this movie
score <- html_nodes(score_content, ".ipl-rating-widget > .ipl-rating-star .ipl-rating-star__rating")

output_name <- unlist(strsplit(html_text(name), split="Original title: "))[2]
output_score <- as.numeric(html_text(score))

output_name
output_score
