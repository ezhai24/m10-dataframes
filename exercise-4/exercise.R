# Exercise 4: Gates Foundation Educational Grants

# Read data into a variable called `grants` using the `read.csv` function
# Make sure *not* to read the strings as factors
setwd("~/Documents/University of Washington/Junior/Spring Quarter/Info 201/Classwork/m10-dataframes/exercise-4")
grants <- read.csv('./data/gates_money.csv', stringsAsFactors = FALSE)

# Use the View function to look at your data
View(grants)

# Create a variable `spending` as the `total_amount` column of the dataset
spending <- grants$total_amount

# Confirm that your `spending` variable is a vector using the `is.vector` function
is.vector(spending)

# Create a variable `org` as the `organization` column of the dataset.
org <- grants$organization

### Now you can ask some more interesting questions about the dataset.  Store your answers in variables ###

# What was the mean grant value?
mean.grant <- mean(spending)

# What was the dollar amount of the largest grant?
max.grant <- max(spending)

# What was the dollar amount of the smallest grant?
min.grant <- min(spending)

# Which organization received the largest grant?
max.grant.org <- org[spending == max.grant]

# Which organization received the smallest grant?
min.grant.org <- org[spending == min.grant]

# How many grants were awarded in 2010?
Y2010.grants <- nrow(grants[expenditure$start_year == 2010])
