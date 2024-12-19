#Remove any missing values for response variable
PLD <- PLD %>%
  filter(!is.na(Best3BenchKg))

