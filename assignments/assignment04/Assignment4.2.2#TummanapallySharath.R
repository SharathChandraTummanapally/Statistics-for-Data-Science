# Assignment: ASSIGNMENT 4.2.2
# Name: Tummanapally, Sharath Chandra
# Date: 2021-09-25

library(readxl)
library(plyr)
library(ggplot2)

# Loading Housing dataset.
housing_df <- read_excel('data/week-7-housing.xlsx')
str(housing_df)

# We interact with a few datasets in this course, one you are already familiar with, the 2014 American Community Survey and the second is a Housing dataset, that provides real estate transactions recorded from 1964 to 2016.  For this exercise, you need to start practicing some data transformation steps – which will carry into next week, as you learn some additional methods.  For this week, using either dataset (or one of your own – although I will let you know ahead of time that the Housing dataset is used for a later assignment, so not a bad idea for you to get more comfortable with now!), perform the following data transformations:
# a.  Use the apply function on a variable in your dataset
# using apply function, getting the sum of bedrooms.
apply(housing_df['bedrooms'],2,sum)

# b.  Use the aggregate function on a variable in your dataset
# using aggregate function, getting the mean of sale price.
aggregate(housing_df$`Sale Price` ,list(housing_df$sitetype),mean)

# c.  Use the plyr function on a variable in your dataset – more specifically, I want to see you split some data, perform a modification to the data, and then bring it back together
# using the 'ddply' function, getting Average sale price by year a house is built.
avgspyear_df <- ddply(housing_df,.(year_built), summarise, 'Average Sale Price'=mean(`Sale Price`))
avgspyear_df

# d.  Check distributions of the data
# I've created the scatter plot for the above variable avgspyear_df and added a regression trend line. This shows the distribution.
ggplot(data = avgspyear_df, aes(x=`year_built`,y=`Average Sale Price`)) + geom_point() + geom_smooth()

# e.  Identify if there are any outliers
#     Yes. Based on the scatter plot, we can see there are outliers. In some year the Average 
#     sale price is very high and is kind of abnormal from other values.

# f.  Create at least 2 new variables
# adding two variables to data frame.
housing_df$'Home Type' <- ""
housing_df$'HOA' <- 0