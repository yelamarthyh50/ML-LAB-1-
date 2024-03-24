# ML-LAB-1-
# Student Performance Prediction Model

The code for creating a prediction model to gauge student performance based on variables including study time, test results, forum activity, and prior grades is available in this repository. R is used to implement the model through supervised learning methods.

## Dataset Generation

The dataset is simulated to mimic student performance data. It includes features such as study hours, quiz scores, forum participation, previous grades, and final grades. The simulated data is generated with a fixed random seed for reproducibility.

## Model Development

1. **Data Splitting**: The dataset is split into training and testing sets with a ratio of 80:20, respectively. This allows for training the model on a subset of the data and evaluating its performance on unseen dataThe dataset is divided in an 80:20 ratio into training and testing sets. This enables the model to be trained on a portion of the data and its performance to be assessed on data that hasn't been seen yet.


2. **Model Specification**: Because logistic regression works well for binary classification problems, it is selected as the predictive model. The `{parsnip}} package is used to specify the model, and the engine is configured to use a generalized linear model (glm) for logistic regression.


3. **Feature Engineering**: To organize the data before to model training, a recipe is developed. The recipe identifies the predictor variables ({StudyHours}, {QuizScores}, {ForumPosts}, {PreviousGrades}) and the outcome variable ({FinalGrades}).


4. **Model Training**: The model and recipe are used in the prescribed process to train the model on the training datase

5. **Model Evaluation**: The testing dataset is used to evaluate the trained model's predicted performance. To determine how well the model predicts student grades, evaluation measures like accuracy and prediction interval are calculated...

## Usage

o execute the code:

Copy this repository to your computer.
Access the R script or R Markdown file using your chosen R development environment.
Install the necessary packages as indicated in the script.
Execute the code step by step to create simulated data, train the model, and assess its effectiveness.

## Dependencies

To run the code successfully, ensure you have the following R packages installed:

{tidymodels}: Used for data modeling and preprocessing.
{rsample}: Required for data splitting and resampling.
{parsnip}: Essential for defining machine learning models.
{dplyr}: Necessary for data manipulation tasks.
{ggplot2}: Used for creating visualizations.
You can install these packages using the install.packages() function if they are not already installed in your R environment.

