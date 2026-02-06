# Install package (only once)
install.packages("readxl")

# Load package
library(readxl)

# Read Excel file
data <- read_excel("students.xlsx")
print(data)

# Check for missing values
colSums(is.na(data))

# Remove missing values
data_clean <- na.omit(data)
data_clean

# Summary statistics
summary(data_clean)

# Plot study hours vs score
plot(data_clean$Study_Hours, data_clean$Score,
     main = "Study Hours vs Score",
     xlab = "Study Hours",
     ylab = "Score")

# Build a simple linear model
model <- lm(Score ~ Study_Hours, data = data_clean)
summary(model)

# Predict score for a new student
new_student <- data.frame(Study_Hours = 7)
predict(model, new_student)
