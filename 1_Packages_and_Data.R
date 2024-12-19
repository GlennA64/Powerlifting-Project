library(dplyr)
library(ggplot2)
library(maps)
library(rnaturalearth)
library(rnaturalearthdata)
library(vcd)
library(corrplot)
library(lme4)
library(lubridate)
library(lattice)
library(car)
library(performance)
library(caret)
library(Metrics)

PLD <- read.csv("Data.csv")

mappings <- list(
  "UK" = "United Kingdom",
  "England" = "United Kingdom",
  "Scotland" = "United Kingdom",
  "Wales" = "United Kingdom",
  "N.Ireland" = "United Kingdom",
  "USA" = "United States of America",
  "United States" = "United States of America",
  "Russia" = "Russia",
  "USSR" = "Russia",
  "Serbia and Montenegro" = "Serbia",
  "Czechoslovakia" = "Czechia",
  "West Germany" = "Germany",
  "East Germany" = "Germany",
  "Ivory Coast" = "Côte d'Ivoire",
  "Eswatini" = "eSwatini",
  "Syria" = "Syria",
  "Vietnam" = "Vietnam",
  "The Gambia" = "Gambia",
  "Taiwan" = "Taiwan",
  "Yugoslavia" = "Serbia",
  "North Macedonia" = "North Macedonia",
  "Czechia" = "Czechia",
  "Cape Verde" = "Cabo Verde",
  "Laos" = "Laos",
  "Palestine" = "Palestine",
  "South Korea" = "South Korea",
  "North Korea" = "North Korea",
  "Vatican City" = "Vatican",
  "Micronesia" = "Micronesia",
  "St. Vincent and Grenadines" = "St. Vin. and Gren.",
  "Saint Vincent and the Grenadines" = "St. Vin. and Gren.",
  "Wallis and Futuna" = "Wallis and Futuna Is.",
  "Comoros" = "Comoros",
  "Congo" = "Congo",
  "Democratic Republic of Congo" = "Dem. Rep. Congo",
  "Myanmar" = "Myanmar",
  "Burma" = "Myanmar",
  "Saint Helena" = "Saint Helena",
  "Bahamas" = "Bahamas",
  "Curaçao" = "Curaçao",
  "Brunei" = "Brunei",
  "São Tomé and Principe" = "São Tomé and Principe",
  "Timor-Leste" = "Timor-Leste",
  "Macao" = "Macao",
  "Hong Kong" = "Hong Kong"
  # Extend as needed for other cases
)

# Define a function to map values
map_country <- function(country, mapping) {
  if (!is.na(country) && country %in% names(mapping)) {
    return(mapping[[country]])
  } else {
    return(country)
  }
}

# Apply to PLD columns
PLD$Country <- sapply(PLD$Country, map_country, mapping = mappings)
PLD$MeetCountry <- sapply(PLD$MeetCountry, map_country, mapping = mappings)
