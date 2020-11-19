library(googlesheets4)
library(googledrive)

store_record <- function(dt){
  spreadsheet <- gs4_get("survey_response") %>% sheet_append(dt)
}

response <- data.frame('Apple', 0,0,1,0,'Orange',4,4,3,1,1,'I want pancakes for breakfast!',as.Date('1996-01-09'))

store_record(response)