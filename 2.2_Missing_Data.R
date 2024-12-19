#Remove any missing values for response variable
PLD <- PLD %>%
  filter(!is.na(Best3BenchKg))

#Missing values
sapply(PLD, function(x) sum(is.na(x)))

# Create binary indicators for missing data
PLD <- PLD %>%
  mutate(
    missing_Age = ifelse(is.na(Age), 1, 0),
    missing_BodyweightKg = ifelse(is.na(BodyweightKg), 1, 0),
  )

#Table function to compare missing column with other columns, easily editable
table(PLD$missing_BodyweightKg, PLD$Country)
       
#Age Missing Data by Country (easily change to MeetCountry)
world <- ne_countries(scale = "medium", returnclass = "sf")
missing_data <- PLD %>%
  group_by(Country) %>%
  summarise(
    missing_Age = sum(is.na(Age)),
    total_missing_Age = sum(is.na(PLD$Age)) # Global total
  ) %>%
  mutate(missing_contribution = missing_Age / total_missing_Age)
map_data <- world %>%
  left_join(missing_data, by = c("sovereignt" = "Country")) #Change Country/MeetCountry here as well
map_data$missing_contribution[is.na(map_data$missing_contribution)] <- 0
ggplot(data = map_data) +
  geom_sf(aes(fill = missing_contribution), color = "white", size = 0.2) +
  scale_fill_gradient(
    low = "blue", 
    high = "red", 
    na.value = "grey90", 
    name = "Contribution (%)",
    labels = scales::percent
  ) +
  theme_minimal() +
  labs(
    title = "Countries' Contribution to Missing Age Data"
  )

#Bodyweight Missing Data by Country
missing_data_bw <- PLD %>%
  group_by(MeetCountry) %>%
  summarise(
    missing_BodyweightKg = sum(is.na(BodyweightKg)),
    total_missing_BodyweightKg = sum(is.na(PLD$BodyweightKg)) # Global total
  ) %>%
  mutate(missing_contribution = missing_BodyweightKg / total_missing_BodyweightKg)
map_data_bw <- world %>%
  left_join(missing_data_bw, by = c("sovereignt" = "MeetCountry")) #Change Country/MeetCountry here as well
ggplot(data = map_data_bw) +
  geom_sf(aes(fill = missing_contribution), color = "white", size = 0.2) +
  scale_fill_gradient(
    low = "blue", 
    high = "red", 
    na.value = "grey90", 
    name = "Contribution (%)",
    labels = scales::percent
  ) +
  theme_minimal() +
  labs(
    title = "Meet Countries' Contribution to Missing BodyweightKg Data"
  )

# Filter out rows where Sex is "Mx"
PLD<- PLD %>%
  filter(Sex != "Mx")

#Missing age against sex, change for bodyweight easily
ggplot(PLD, aes(x = Sex, fill = factor(missing_BodyweightKg))) +
  geom_bar(position = "fill") +
  scale_fill_manual(
    values = c("0" = "blue", "1" = "red"),
    labels = c("0" = "Not Missing", "1" = "Missing")
  ) +
  scale_y_continuous(labels = scales::percent) +
  labs(
    title = "Proportion of Missing BodyweightKg by Sex",
    y = "Proportion (%)",
    fill = "Missing BodyweightKg"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14),
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10)
  )
