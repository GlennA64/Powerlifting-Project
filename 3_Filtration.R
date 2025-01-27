
summary(PLD)

PLD_2=PLD

PLD_2 <- PLD_2 %>%
  filter(!(Place %in% c("DQ", "DD", "NS")))

PLD_2 <- PLD_2 %>%
  filter(!is.na(Age))

PLD_2 <- PLD_2 %>%
  filter(!is.na(BodyweightKg))

PLD_2 <- PLD_2 %>%
  filter(!is.na(Best3BenchKg))

table(PLD_2$Equipment)
table(PLD_2$Sex)

# Ensure the Date column is in Date format
PLD_2$Date <- as.Date(PLD_2$Date, format = "%Y-%m-%d")

# Create new columns for first competition date and first achieved lift
PLD_2 <- PLD_2 %>%
  group_by(Name) %>%
  arrange(Date) %>%
  mutate(
    FirstLiftDate = first(Date),  # Get the first date for each individual
    FirstLiftWeight = first(Best3BenchKg)  # Get the first achieved weight for each individual
  ) %>%
  ungroup()  # Ungroup to avoid unintended grouping


# Filter data to include only dates from 2010 onwards
PLD_2 <- subset(PLD_2, Date >= as.Date("2010-01-01"))

PLD_2 <- PLD_2 %>%
  arrange(Name, Date)

#One entry per date
PLD_2 <- PLD_2 %>%
  group_by(Name, Date) %>%
  slice_max(order_by = Best3BenchKg, n = 1) %>%
  ungroup()

PLD_2 <- PLD_2 %>%
  distinct(Name, Date, Best3BenchKg, .keep_all = TRUE)

# Filter dataset based on 6-month intervals
PLD_2 <- PLD_2 %>%
  arrange(Name, Date) %>%  # Ensure data is ordered by person and date
  group_by(Name) %>%
  filter(n() >= 2) %>%  # Ensure at least 2 entries per person
  mutate(
    # Calculate the time difference in months from the previous entry for each person
    date_diff = as.numeric(difftime(Date, lag(Date), units = "days")) / 30.44,
    keep_entry = ifelse(is.na(date_diff) | date_diff >= 6, TRUE, FALSE)
  ) %>%
  filter(keep_entry) %>%  # Keep only rows that are at least 6 months apart
  ungroup() %>%
  select(-date_diff, -keep_entry)  # Remove helper columns if not needed

# Create a subset where names appear at least 6 times
PLD_2 <- PLD_2 %>%
  group_by(Name) %>%
  filter(n() >= 6) %>%
  ungroup()

summary(PLD_2)
View(PLD_2)
# Export the filtered data as PLD2.csv
write.csv(PLD_2, "C:\\Users\\My PC\\Documents\\Dissertation\\Dataset\\PLD2.csv", row.names = FALSE)
