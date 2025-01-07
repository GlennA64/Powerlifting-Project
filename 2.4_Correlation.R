# Create a scatter plot of Age vs Best3BenchKg change for other variables
ggplot(PLD, aes(x = Age, y = BodyweightKg)) +
  geom_point(color = "blue") +  # Plot points in blue
  labs(title = "Age vs BodyweightKg", 
       x = "Age", 
       y = "BodyweightKg") +
  theme_minimal()

# Subset the data, excluding missing data columns and Year
numerical_data <- PLD[, c("Age", "BodyweightKg", "Best3BenchKg")]
# Remove rows with missing data (optional, but recommended for correlation analysis)
numerical_data_clean <- na.omit(numerical_data)
# Calculate correlation matrix for numerical variables
correlation_matrix <- cor(numerical_data_clean)
print(correlation_matrix)
# Visualize the correlation matrix
corrplot(correlation_matrix, method = "circle", type = "upper", tl.col = "blue", tl.srt = 45)

# Boxplot for Age by Sex change for other variables
ggplot(PLD, aes(x = Equipment, y = Best3BenchKg)) +
  geom_boxplot(fill = "blue", color = "red") +
  labs(title = "Boxplot of Best3BenchKg by Equipment", x = "Equipment", y = "Best3BenchKg") +
  theme_minimal()

# Create a scatter plot of Age vs Date
ggplot(PLD, aes(x = Date, y = BodyweightKg)) +
  geom_point(color = "blue") +  # Plot points in blue
  labs(title = "BodyweightKg vs Date", 
       x = "Date", 
       y = "BodyweightKg") +
  theme_minimal()
