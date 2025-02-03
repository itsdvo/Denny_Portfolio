# Denny_Portfolio

## Project 1 - Vehicle Accident Detection with CNN

Contains multiple steps and evaluations to classify vehicle images into accident-related categories.

* Data Preparation:  
  + Collected and labeled images into two categories: "Accident" and "No Accident."
  + Applied transformations (resize: 224x224, normalization, and tensor conversion) for consistent input.
* Exploratory Data Analysis (EDA):
  + Visualized sample images and inspected class distribution.  
  + Performed preliminary checks for data consistency.
* Model Training & Evaluation:
  + Architecture: Built a custom CNN with convolutional, pooling, and fully connected layers.  
  + Training:
    - Dataset split: 70% training, 30% testing.  
    - Loss function: CrossEntropyLoss; Optimizer: Adam (LR: 0.001).  
  + Evaluation:
    - Metrics: Precision, recall, F1-score, confusion matrix, and ROC curve.  
    - Achieved an AUC of 0.92, demonstrating strong performance.
* Performance Optimization:
  + Reduced overfitting by monitoring training and validation loss trends.  
  + Improved model generalization with early stopping and learning rate adjustments.



## Project 2 - Python -  Vehicle Insurance Claim Fraud Detection

Perform various codes for correlation analysis

* Setting up:
    + Imported necessary libraries (tidyverse, caret, ggplot2, randomForest, tensorflow).
* Cleaning:
    + Encoded categorical variables for model training.
* Exploratory Data Analysis (EDA):
    + Visualized distributions of key variables using histograms and boxplots.
    + Identified correlations between variables using a heatmap.
* Model Training & Evaluation:
    + Implemented multiple machine learning models: Logistics Regression, Decision Tree, and Random Forest.
    + Evaluated models using accuracy, ROC-AUC, and confusion matrix.
* Cross-Validation & Optimization:
    + Applied K-Fold Cross-Validation to improve model performance.
    + Tuned hyperparameters for better accuracy.

## Project 3 - Power BI -  Data_Professional_Survey_Breakdown

Visualize data professional survey collected by Alex Freberg

* Visualization 1:
    + Treemap of countries that respondents reside
* Visualization 2:
    + Cluster bar chart of job titles by average salary
* Visualization 3:
    + Count of distinct survey respondents and their average age
* Visualization 4:
    + Stacked column chart for a breakdown of languages favored by job title
* Visualization 5:
    + Donut chart of difficulty to break into the data industry
* Visualization 6:
    + Gauges for how happy respondents were happy with

## Project 4 - SQL & Draw.io -  Inventory Management Systems for ARPGs

* Draw.io:
    + Developed a comprehensive database design incorporating both conceptual and logical models, detailing cardinalities and inter-table relationships to optimize data integrity and access
* SQL Server Management Studio:
    + Authored SQL scripts to construct database tables, ensuring proper implementation of primary (PK) and foreign key (FK) constraints along with suitable data types to support system requirements
    + Populated tables with manually generated sample data to facilitate testing and demonstration of database functionality
    + Crafted several SQL queries to enable efficient item identification and retrieval for player inventories, enhancing user experience and system responsiveness
 * PPT:
    + Created a polished presentation to outline project scope, design rationale, and functionality, effectively communicating the system's capabilities and architecture to stakeholders
