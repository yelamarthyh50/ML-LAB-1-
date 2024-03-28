# Load necessary libraries
 
library(tidyverse)  # For data manipulation and visualization
 
library(tidymodels)  # For modeling workflows
 
library(janitor)  # For data cleaning
 
# Read in the data
students_data <- read_csv("studentInfo.csv")
 
# Mutate variables for pass and disability
students_data <- students_data %>%
  mutate(pass_binary = ifelse(final_result == "Pass", 1, 0)) %>%  # Binary indicator for pass/fail
  mutate(pass_binary = as.factor(pass_binary))  # Convert to factor
 
students_data <- students_data %>%
  mutate(disability_factor = as.factor(disability))  # Convert disability to factor
 
# Examine the data
students_data
 
# Feature engineering for imd_band
students_data <- students_data %>%
  mutate(imd_band_factor = factor(imd_band, levels = c("0-10%", "10-20%", "20-30%", "30-40%", "40-50%", "50-60%", "60-70%", "70-80%", "80-90%", "90-100%"))) %>%
  mutate(imd_band_factor = as.integer(imd_band_factor))  # Convert to integer
 
# Split data into train and test sets
set.seed(20230712)
train_test_split <- initial_split(students_data, prop = 0.80)
data_train <- training(train_test_split)
data_test <- testing(train_test_split)
 
# Create a recipe
my_recipe <- recipe(pass_binary ~ disability_factor + imd_band_factor, data = data_train)
 
# Specify the logistic regression model
my_logistic_model <- 
  logistic_reg() %>% 
  set_engine("glm") %>% 
  set_mode("classification")
 
# Combine model and recipe into a workflow
my_workflow <- 
  workflow() %>% 
  add_model(my_logistic_model) %>% 
  add_recipe(my_recipe)
 
# Fit the model
fitted_model <- fit(my_workflow, data = data_train)
 
# Create a resampling object for the testing data
test_split <- rsample::initial_split(data_test, prop = 0.8)
 
# Fit the model using the testing data
final_fit <- last_fit(my_workflow, split = test_split)
 
# View the final fitted model
final_fit
 
# Collect predictions
final_predictions <- final_fit %>%
  collect_predictions()
 
# Interpret accuracy
accuracy_table <- final_predictions %>%
  select(.pred_class, pass_binary) %>%
  mutate(correct_prediction = .pred_class == pass_binary) %>%
  tabyl(correct_prediction)
 
# Display accuracy table
accuracy_table
 
# Wrap up and knit the document
