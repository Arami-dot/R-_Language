dir.create('raw_data')
dir.create('scripts')
dir.create('clean_data')

cholesterol <- 230

if (cholesterol > 240){
  print('High cholesterol')
}

systolic_bp <- 130

if (systolic_bp < 120){
  print('Blood pressure is normal')
}else{
  print('Blood pressure is high')
}

data <- read.csv(file.choose())
View(data)

raw_data <- data
View(raw_data)
str(raw_data)

factor_cols <- c('patient_id', 'gender', 'diagnosis', 'smoker')
factor_cols


for (col in factor_cols) {
 raw_data[[col]] <- as.factor(raw_data[[col]]) 
}

str(raw_data)

binary_cols <- c('smoker')
binary_cols

for (col in binary_cols) {
  raw_data[[col]] <- ifelse(raw_data[[col]] == "Yes",1,0)
}

str(raw_data)
str(data)

write.csv(data, file = 'clean_data/syntax_clean_csv')

save.image(file = 'Davies_Syntax_Class.RData')
