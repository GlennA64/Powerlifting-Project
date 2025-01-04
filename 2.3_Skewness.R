#Skewness

##Age

# Create a histogram of the Age column
ggplot(data = PLD, aes(x = Age)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "red", alpha = 0.7) +
  labs(title = "Age Distribution of Individuals",
       x = "Age",
       y = "Frequency") +
  theme_minimal(base_size = 15) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title = element_text(face = "bold")
  )

##BodyweightKg

# Create a histogram of the BodyweightKg column
ggplot(data = PLD, aes(x = BodyweightKg)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "red", alpha = 0.7) +
  labs(title = "Bodyweight Distribution of Individuals",
       x = "Bodyweight (kg)",
       y = "Frequency") +
  theme_minimal(base_size = 15) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title = element_text(face = "bold")
  )

##Best3BenchKg

# Create a histogram of the Best3BenchKg column
ggplot(data = PLD, aes(x = Best3BenchKg)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "red", alpha = 0.7) +
  labs(title = "Best Bench Press Distribution",
       x = "Best 3 Bench (kg)",
       y = "Frequency") +
  theme_minimal(base_size = 15) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title = element_text(face = "bold")
  )

##Country of Origin

# Get world map data
world <- ne_countries(scale = "medium", returnclass = "sf")

# Summarize counts of individuals by country
country_counts <- PLD %>%
  group_by(Country) %>%
  summarise(Count = n())

# Merge world map data with country counts
world_data <- left_join(world, country_counts, by = c("name" = "Country"))

# Replace NA counts with 0 (for countries with no data)
world_data$Count[is.na(world_data$Count)] <- 0

# Create the choropleth map
ggplot(data = world_data) +
  geom_sf(aes(fill = Count), color = "white") +
  scale_fill_gradient(low = "blue", high = "red", na.value = "gray85",
                      name = "Number of Individuals") +
  labs(
    title = "Distribution of Individuals by Country",
    caption = "Countries with no data are shown in gray"
  ) +
  theme_minimal(base_size = 15) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    panel.grid = element_blank()
  )

## Country Meet

# Summarize counts of meets by country
meet_counts <- PLD %>%
  group_by(MeetCountry) %>%
  summarise(MeetCount = n())

# Merge world map data with meet counts
world_data_meets <- left_join(world, meet_counts, by = c("name" = "MeetCountry"))

# Replace NA counts with 0 (for countries with no data)
world_data_meets$MeetCount[is.na(world_data_meets$MeetCount)] <- 0

# Create the choropleth map for MeetCountry
ggplot(data = world_data_meets) +
  geom_sf(aes(fill = MeetCount), color = "white") +
  scale_fill_gradient(low = "Blue", high = "Red", na.value = "gray85",
                      name = "Number of Meets") +
  labs(
    title = "Distribution of Meets by Country",
    caption = "Countries with no data are shown in gray"
  ) +
  theme_minimal(base_size = 15) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    panel.grid = element_blank()
  )

##Date

# Convert the Date column to Date type
PLD$Date <- as.Date(PLD$Date, format = "%Y-%m-%d") # Adjust the format if needed

# Plot the histogram
ggplot(PLD, aes(x = Date)) +
  geom_histogram(binwidth = 30, fill = "blue", color = "blue", alpha = 0.7) +
  labs(title = "Histogram of Dates", x = "Date", y = "Frequency") +
  theme_minimal()

summary(PLD)

# Create a bar plot to compare the counts of each sex in PLD$Sex
ggplot(PLD, aes(x = Sex)) +
  geom_bar(fill = "blue", color = "red") +
  labs(title = "Distribution of Sex in PLD", 
       x = "Sex", 
       y = "Count") +
  theme_minimal()

# Summarize data: Get counts of each ParentFederation
parent_federation_data <- as.data.frame(table(PLD$ParentFederation))
colnames(parent_federation_data) <- c("ParentFederation", "Count") # Rename columns
parent_federation_data$Count <- as.numeric(parent_federation_data$Count) # Ensure Count is numeric
# Add random x and y positions for each bubble
set.seed(8) # For reproducibility
parent_federation_data$x <- runif(nrow(parent_federation_data), min = 0, max = 4)
parent_federation_data$y <- runif(nrow(parent_federation_data), min = 0, max = 4)
# Create the bubble chart
ggplot(parent_federation_data, aes(x = x, y = y, size = Count)) +
  geom_point(alpha = 0.7, color = "blue") + # Bubbles
  geom_text(aes(label = ParentFederation), color = "black", fontface = "bold", size = 3) + # Labels
coord_fixed(xlim = c(-1, 5), ylim = c(-1, 5)) + # Fix axis limits
  scale_size(range = c(20, 70)) + # Adjust bubble sizes
  theme_void() + # Minimalist theme with no axes
  labs(
    title = "Bubble Chart of Parent Federations"
  ) +
  theme(legend.position = "none") # Remove the legend
