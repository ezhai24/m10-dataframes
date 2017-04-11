# Exercise 3: Working with Data Frames

# Load R's "USPersonalExpenditure" dataest using the `data()` function
data("USPersonalExpenditure")

# The variable USPersonalExpenditure is now accessible to you. Unfortunately, it's not a data.frame
# Test this using the is.data.frame function
is.data.frame(expenditure)

# Luckily, you can simply pass the USPersonalExpenditure variable to the data.frame function
# to convert it a data.farme

# Create a new variable by passing the USPersonalExpenditure to the data.frame function
expenditure <- data.frame(USPersonalExpenditure, stringsAsFactors = FALSE)

# What are the column names of your dataframe?
colnames(expenditure)

# Why are they so strange?
# R dataframe column/row names cannot begin with a number

# What are the row names of your dataframe?
rownames(expenditure)

# Create a column `category` that is equal to your rownames
expenditure$category = rownames(expenditure)

# How much money was spent on personal care in 1940?
expenditure['Personal Care', 'X1940']

# How much money was spent on Food and Tobacco in 1960
expenditure['Food and Tobacco', 'X1960']

# What was the highest expenditure category in 1960?
rownames(expenditure)[expenditure$X1960 == max(expenditure$X1960)]

### Bonus ###

# Write a function that takes in a year as a parameter, and 
# returns the highest spending category of that year
HighestSpendingCategory <- function(year) {
  yearColumn <- paste(c('X', 1940), collapse = "")
  return(rownames(expenditure)[expenditure[[yearColumn]] == max(expenditure[[yearColumn]])])
}

# Using your function, determine the highest spending category of each year
HighestSpendingCategory(1940)
HighestSpendingCategory(1945)
HighestSpendingCategory(1950)
HighestSpendingCategory(1955)
HighestSpendingCategory(1960)

# Write a loop to cycle through the years, and store the highest spending category of
# each year in a list
