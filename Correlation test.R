#CORRELATION TEST
#  Correlation test is used to evaluate the association between two
#or more variables.
#Install and load required R packages
install.packages("ggpubr")
library("ggpubr")

#Compute correlation in R
#R functions 
#Correlation coefficient can be computed using the functions 
#cor():
#      -computes the correlation coefficient
#cor.test():
#      -test for association/correlation between paired samples.It returns the correlation coefficient and significance level(or p-value).

#Import your data in R
my_data <- mtcars
my_data
head(my_data,6)

#Visualize your data using scatter plots
library("ggpubr")
ggscatter(my_data,x="mpg",y="wt",add="reg.line",conf.int = TRUE,
          cor.coef = TRUE,cor.method = "pearson",xlab="Miles/(US) gallon",
          ylab = "Weight(1000 lbs)")

#Check for Normality
#SHAPIRO WILK'S TEST
###Null Hypothesis(H0): The data follows a normal distribution.##
##Alternative Hypothesis(H1): The data does not follow a normal distribution.##
shapiro.test(my_data$mpg)
shapiro.test(my_data$wt)
#From the output, the p-value > 0.05, we can assume normality

#Visual inspection 
library("ggpubr")
#mpg
ggqqplot(my_data$mpg,ylab="MPG")
#wt
ggqqplot(my_data$wt,ylab="WT")

#From the normality plots,we conclude that both populations may come form normal
#distributions

#PEARSON CORRELATION TEST
res <- cor.test(my_data$wt,my_data$mpg,method="pearson")
res

#Interpretation of the result:
#The p-value of the test is 1.29410^{-10}, which less than the 0.05
#we can conclude that wt and mpg are significantly correlated.

#KENDALL RANK CORRELATION TEST
res1 <- cor.test(my_data$wt,my_data$mpg,method="kendall")
res1

#SPEARMAN RANK CORRELATION COEFFICIENT
res2 <- cor.test(my_data$wt,my_data$mpg,method="spearman")
res2

#Interpret correlation coefficient

#-1 indicates a strong negative correlation : this means that x increases and y decreases
# 0 means that there is  no association between the two variables (x and y)
# 1 indicates a strong positive correlation : this means y increases with x .

