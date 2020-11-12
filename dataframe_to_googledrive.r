library("googlesheets")

fruit_SC <- c('Apple', 'Apple','Banana','Banana','Apple')
fruit_MC_Apple <- c(1,1,0,0,0)
fruit_MC_Banana <- c(0,1,1,0,0)
fruit_MC_Cherry <- c(0,0,0,1,0)
fruit_MC_Orange <- c(0,0,0,0,1)
fruit_DD <- c('Apple', 'Apple','Banana','Banana','Apple')
banana_rating <-c(4,2,1,5,2)
staff_rating <- c(5,3,2,2,1)
cleanliness_rating <- c(2,3,3,1,5)
spa_rating <- c(1,1,4,2,3)
food_rating <- c(4,4,3,5,1)
opinion <- c('I liked the food.', 'Room was clean.', 'Stff was impolite', 'The hotel is too expensive.', 'I can fully recommend.')
date_of_birth <- as.Date(c('1983-03-04','1992-11-23','1960-06-09','1972-08-11','1997-05-28'))

response <- data.frame(fruit_SC, fruit_MC_Apple,fruit_MC_Banana,fruit_MC_Cherry,fruit_MC_Orange, fruit_DD, banana_rating, staff_rating, cleanliness_rating, spa_rating, food_rating, opinion, date_of_birth)
names(response) <- c('Favorite fruit - SC', 'Favorite fruits - MCApple', 'Favorite fruits - MCBanana','Favorite fruits - MCCherry','Favorite fruits - MCOrange','Favorite fruit - DD', 'Rating of bananas', 'Rating of staff', 'Rating of cleanliness', 'Rating of spa', 'Rating of food', 'Opinion', 'Dat of birth')

print('hello')
print(response)

write.csv(response, "C:\\Users\\clgrof\\Documents\\response.csv", row.names = FALSE)
response_sheet <- drive_upload(
  "C:\\Users\\clgrof\\Documents\\response.csv"
)