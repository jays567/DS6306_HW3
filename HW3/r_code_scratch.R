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

# Questionn 3 - Output females and males aboard the Titanic.
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

