# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100)
employees <- paste("Employee", 1:100)

# Create a vector of 2014 salaries using the runif function
fourteen.salaries <- runif(100, 80000, 100000)

# Create a vector of 2015 salaries that are typically higher than the 2014 salaires (use runif again)
fifteen.salaries <- runif(100, 85000, 105000)

# Create a data.frame 'salaries' by combining the vectors you just made
salaries <- data.frame(fourteen.salaries, fifteen.salaries)

# Create a column 'raise' that stores the size of the raise between 2014 and 2015
salaries$raise <- fifteen.salaries - fourteen.salaries

# Create a column 'got.raise' that is TRUE if the person got a raise
salaries$got.raise <- fifteen.salaries - fourteen.salaries > 0

# Retrieve values from your data frame to answer the following questions:

# What was the 2015 salary of employee 57
salaries[[57, 'fifteen.salaries']]

# How many employees got a raise?
nrow(salaries[salaries$got.raise,])

# What was the value of the highest raise?
max(salaries$raise)

# What was the name of the employee who recieved the highest raise?
rownames(salaries[salaries$raise == max(salaries$raise),])

# What was the largest decrease in salaries between the two years?
min(salaries$raise)

# What was the name of the employee who recieved largest decrease in salary?
rownames(salaries[salaries$raise == min(salaries$raise),])

# What was the average salary increase?
Reduce("+", salaries$raise) / nrow(salaries)

### Bonus ###

# Write a .csv file of your salaries to your working directory
write.csv(salaries, file="./salaries.csv")

# For people who did not get a raise, how much money did they lose?
salaries[salaries$raise < 0,]

# Is that what you expected them to lose?
# Looks right given the magnitude of the salary increase from 2014 to 2015

### Double Bonus (no answer given) ###

# Repeat the above experiment 100 times, tracking the loss each time.
FindAvgLoss <- function(runTimes){
  totalLoss <- 0
  for(i in 1:runTimes) {
    fourteen.salaries <- runif(100, 80000, 100000)
    fifteen.salaries <- runif(100, 85000, 105000)
    raise <- fifteen.salaries - fourteen.salaries
    salaries <- data.frame(fourteen.salaries, fifteen.salaries, raise)
    totalLoss <- totalLoss + Reduce("+", salaries[salaries$raise < 0,]$raise)
  }
  avgLoss <- totalLoss / (runTimes * nrow(salaries))
  return(avgLoss)
}

# Does the average loss equal what you expect?
# Looks right with the the salary range increase by $5,000

# What about 10,000 times?
FindAvgLoss(10000)

