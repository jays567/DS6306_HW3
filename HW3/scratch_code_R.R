# Take the log of a positive number
log(10)

# The default base of the log function defaults to e=exp(1) according to the following help file: 
?log()

# Calculate the log of the above with a different base
log2(10)

# Take the log of a negative number
log(-10)

# The log function is based off of the natural log function which is only defined for X > 0. The negative number is not defined therefore we receive NaN for not a number or undefined.



# Take the square root of a positive number
sqrt(10)

# Create a vector of 15 standard normal random variables.
testVector <- rnorm(15)
testVector

# Calculate the vector's mean and standard deviation (note that by default the mean is 0 and SD is 1)
mean(testVector)
sd(testVector)

# Change the mean to 10 and the SD to 2 and recalculate the vector of 15 random normal variables
testVector2 <- rnorm(15, mean=10, sd=2)
testVector2

# Calculate the mean and SD for the new vector
mean(testVector2)
sd(testVector2)

# Create a vector for dataset 1
weights <- c(60,72,57,90,95,72)
heights <- c(1.80,1.85,1.72,1.90,1.74,1.91)

# Create a simple scatterplot of weight vs. height
plot(weights, heights, main = "Weight vs. Height Scatterplot",
  xlab = "Weight", ylab = "Height")

# Calculate the BMI for each individual - weight / sq of height
Individual1 <- weights[1] / (heights[1]^2)
Individual2 <- weights[2] / (heights[2]^2)
Individual3 <- weights[3] / (heights[3]^2)
Individual4 <- weights[4] / (heights[4]^2)
Individual5 <- weights[5] / (heights[5]^2)
Individual6 <- weights[6] / (heights[6]^2)

Individual1
Individual2
Individual3
Individual4
Individual5
Individual6

# Calculate the mean for the weight
mean(weights)

# Subtract the mean from each value of weight
meanWeights <- weights - 74.33
meanWeights

# Sum the result
sum(meanWeights)

# Create a data frame with 2 columns and various data points mentioned in the homework
?data.frame()
Jayson <- data.frame("Category" = c("Computer Programming","Math","Statistics","Machine Learning","Domain Expertise","Communication","Presentation Skills"),
                     "Rank" = c(5,2,2,1,3,4,4))
Jayson

# Create a bar plot of your classification and scores
install.packages("ggplot2")
library(ggplot2)

JaysonsChart <- ggplot(data=Jayson, aes(x=reorder(Category, -Rank), y=Rank)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + geom_text(aes(x = Category, y = Rank + 0.40, label = round(Rank, 2))) + ggtitle("Data Science Profile")  

JaysonsChart                                                                                                                                                                   
                                                                                                                                                                                              


# create data set
data <- c(1.7,1.6,1.5,2.0,2.3,1.6,1.6,1.8,1.5,1.7,2.2,1.4,1.6,1.6,1.6)

# run a two-tail t.test against the data
t.test(x=data, y=NULL, alternative = ("two.sided"), m=1.8, conf.level=.95, paired = FALSE )

# find critical value for a 95% two-tailed CI; notice we have .025 - this is 0.05 / 2 for both tails
qt(0.025, 14)

# power is the probability of rejecting Ho if it is in fact false; 
# power increases as sample size increases (because more data = less uncertainty about the population)




































