dir.create('data')
dir.create('raw_data')
dir.create('clean_data')
dir.create('scripts')

Cholesterol <- 230
 if (cholesterol > 240){
   print('High Cholesterol')
 }

Systolic_Bp <- 130

if (Systolic_Bp < 120){
  print('Blood Pressure is normal')
}else{
  print('Blood Pressure is high')
}

data<- read.csv(file.choose())
View(data)
str(data)

raw_data <- data
View(raw_data)

factor_cols <- c('name', 'height', 'gender')
factor_cols

for (col in factor_cols) {
  raw_data[[col]] <- as.factor(raw_data[[col]])
}
str(raw_data)

gender_cols <- c('gender')
gender_cols

for (col in gender_cols) {
  raw_data[[col]] <- ifelse(raw_data[[col]] == 'Male',0,1)
}
gender_cols
str(raw_data)

write.csv(data, file = 'clean_data/syntax_class_csv')
save.image(file = 'Davies_syntax_class.RData')
