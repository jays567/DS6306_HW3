# Question 1 - Git Hub Cloning (commented out)
#  $ cd f:/
#  $ cd SMU
#  $ cd DS3606
#  $ cd HW3
#  $ mkdir git_repo
#  $ cd git_repo
#  $ git init
#    Initialized empty Git repository in F:/SMU/DS3606/HW3/git_repo/.git/
#  $ git clone https://github.com/caesar0301/awesome-public-datasets
#    Cloning into 'awesome-public-datasets'...
#    remote: Enumerating objects: 21, done.
#    remote: Counting objects: 100% (21/21), done.
#    remote: Compressing objects: 100% (9/9), done.
#    remote: Total 1758 (delta 12), reused 21 (delta 12), pack-reused 1737
#    Receiving objects: 100% (1758/1758), 661.01 KiB | 1.36 MiB/s, done.
#    Resolving deltas: 100% (1047/1047), done.
#  $ cd awesome-public-datasets
#  $ dir
#    Datasets  LICENSE  README.rst

# Question 2 - read in titanic.csv and assign to df
getwd()
setwd("F:/SMU/DS6306/HW3/git_repo/awesome-public-datasets/Datasets/")
getwd()
df <- read.csv("titanic.csv", header = TRUE, sep=",")
str(df)
summary(df)

# Output the male and female counts

summary(df$Sex)


# Plot the frequency of male and females
tMales_tFemales <- data.frame(df$Sex)
colnames(tMales_tFemales) <- c("Gender")

library(ggplot2)
ggplot(tMales_tFemales, 
       aes(x = Gender, color = Gender, fill = Gender)) + 
  geom_bar() + 
  labs(x = "Gender", y = "Frequency") + 
  geom_text(stat = 'count', aes(label = ..count.., vjust = -0.5)) +
  ggtitle("Gender Frequency") + theme(plot.title = element_text(hjust = 0.5))

# Output the means of age, fare, and survival using one apply function - ensure the output is a real number for all three means

sapply(df[,c("Age","Fare","Survived")], mean, na.rm = TRUE)


# Question #3 Function building

setwd("C:/Users/u385919/Documents") # set wd
getwd() # confirm wd

data_Sleep <- read.csv("sleep_data_01.csv", header = TRUE, sep = ",") # read in csv file

dAge <- data_Sleep$Age # age column assigned
dSleep <- data_Sleep$Duration # sleep duration column assigned
dRses <- data_Sleep$RSES # RSES score assigned

summary(dAge)
summary(dSleep)
summary(dRses)

# define helper function
helper_Function <- function(dAge, dSleep, dRses){
  
  median_dAge <- median(dAge, na.rm = TRUE) # median of age, exclude nulls
  min_dSleep <- min(dSleep, na.rm = TRUE) # min of sleep duration, exclude nulls
  max_dSleep <- max(dSleep, na.rm = TRUE) # max of sleep duration, exclude nulls
  mean_dRses <- mean(dRses, na.rm = TRUE) # mean, exclude nulls
  sd_dRses <- sd(dRses, na.rm = TRUE) # standard deviation, exclude nulls
  range_dSleep <- max_dSleep - min_dSleep # calculate the range
  
  report <- data.frame(median_dAge, mean_dRses / 5, sd_dRses / 5, range_dSleep) # assign to data frame
  names(report) = c("MedianAge", "SelfEsteem", "SE_SD", "DurationRange") # rename column headers
  report <- round(report[,],2) # round to two digits
  
  return(report)
}

helper_Function(dAge, dSleep, dRses)

# Question 4

install.packages("fivethirtyeight") # install five thirty eight package

library(fivethirtyeight) #load package

dataSet <- ls("package:fivethirtyeight")[22] # create list of available packages and assign the 22nd to a list

dataSet # display the name of the 22nd data set

df <- college_recent_grads # assign the 22nd data set to an object df


vignette("fivethirtyeight", package = "fivethirtyeight") # view a more detailed list of the data sets and to locate the URL of the news story
# URL of news story: http://fivethirtyeight.com/datalab/elitist-superfluous-or-popular-we-polled-americans-on-the-oxford-comma/

str(df) # return the dimensions and column names of this data frame

names(df) # return column names for the data frame

ncol(df) # count the number of columns in the data frame

install.packages("dplyr")
library("dplyr")

major_count <- data.frame(df %>% group_by(major_category) %>% count(major_category, sort = TRUE)) # generates a count of each unique value in the major_category field

# create a bar plot of the major_count data, flip the chart, color the bars, order the bars, provide data labels
ggplot(major_count, 
  aes(x = reorder(major_category, n), y = n, color = -n, fill = -n)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Major Category Selected", y = "Count of Major's Selected") + 
  ggtitle("Major Category Selection Frequency") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  geom_text(aes(label = n, hjust = -0.5, vjust = 0.5)) + 
  ylim(0, 35) +  # sets the y axis limit
  coord_flip() # flips the chart

getwd() #get wd
setwd("F:/SMU/DS6306/HW3") # set wd

write.csv(df, file = "FiveThirtyEight_CollegeRecentGrads.csv", row.names = FALSE) # write the fivethirtyeight data to a CSV without row labels

