# function for appending row (data.frame) to goolge sheet

library(googlesheets4)

sheet_id = '1v0Dhyxozn3qz6WW54ZS03_qqO12g1Nzf5gXLBhgSmP0'

append_data <- function(dt){
  sheet_append(ss = sheet_id,
               data = dt)
}

response <- data.frame('Apple', 0,0,1,1,'Banana',4,4,3,1,1,'Rooms were dirty!!',as.Date('1985-05-19'))

append_data(response)