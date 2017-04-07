# Exercise 2: Creating data frames

# Create a vector of the number of points the Seahawks scored the first 4 games of last season
# Hint: (google "Seahawks scores 2016")
seahawksPts <- c(36, 10, 10, 3)

# Create a vector of the number of points the Seahawks have allowed to be scored against them in the first 4 games
opponentPts <- c(6, 9, 12, 9)

# Combine your two vectors into a dataframe
seahawksStats <- data.frame(seahawksPts, opponentPts)

# Create a new column "diff" that is the difference in points
seahawksStats$diff <- abs(seahawksPts - opponentPts)

# Create a new column "won" which is TRUE if the Seahawks wom
seahawksStats$won <- seahawksPts > opponentPts

# Create a vector of the opponents
opponents <- c("Cardinals", "Vikings", "Dolphins", "Rams")

# Assign your dataframe rownames of their opponents
row.names(seahawksStats) <- opponents
