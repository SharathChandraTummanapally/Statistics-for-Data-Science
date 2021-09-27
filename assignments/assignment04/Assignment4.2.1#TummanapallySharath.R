# Assignment: ASSIGNMENT 4.2.1
# Name: Tummanapally, Sharath Chandra
# Date: 2021-09-25

library(ggplot2)

#     A professor has recently taught two sections of the same course with only one difference between the sections. In one section, he used only examples taken from sports applications, and in the other section, he used examples taken from a variety of application areas. The sports themed section was advertised as such; so students knew which type of section they were enrolling in. The professor has asked you to compare student performance in the two sections using course grades and total points earned in the course. You will need to import the Scores.csv dataset that has been provided for you.
#     Use the appropriate R functions to answer the following questions:
# 1.	What are the observational units in this study?
#     The observational units in this study are students in the scores data.

# 2.	Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
#     Categorical variable in the scores data is ‘section’.
#     Quantitative variables in the scores data is ‘count’, ’score’.

# Load the `data/scores.csv` to scores df.
scores_df <- read.csv("data/scores.csv")
scores_df

# 3.	Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.
# Getting sports data from scores data frame.
sports_df <- scores_df[which(scores_df$Section=='Sports'),]
sports_df
# Getting regular data from scores data frame.
regular_df <- scores_df[ which(scores_df$Section=='Regular'), ]
regular_df

# 4.	Use the Plot function to plot each Sections scores and the number of students achieving that score. Use additional Plot Arguments to label the graph and give each axis an appropriate label. Once you have produced your Plots answer the following questions:

# Plotting sports section.
ggplot(data = sports_df, aes(x= Count, y= Score)) + geom_point() + xlab('No. of students') + ylab('Score') + ggtitle('Sports Section')

# Plotting regular section.
ggplot(data = regular_df, aes(x= Count, y= Score)) + geom_point() + xlab('No. of students') + ylab('Score') + ggtitle('Regular Section')

# Plotting two sections in single graph.
ggplot(data = scores_df, aes(x= Count, y= Score, col= Section)) + geom_point() + xlab('No. of students') + ylab('Score') 

# a.	Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency: Can you say that one section tended to score more points than the other? Justify and explain your answer.
#     By looking at the plot above, we could say that Regular section tended to score more points than 
#     Sports section by comparing their total sum of score by each Count of students (10, 20 and 30).
#     Additionally, by calculating the central tendency – Mean of both sections in R, we can see that 
#     Regular section has tended to score more points than Sports section
mean(sports_df$Score)
# [1] 307.3684
mean(regular_df$Score)
# [1] 327.6316

# b.	Did every student in one section score more points than every student in the other section? If not, explain what a statistical tendency means in this context.
#     Considering the data provided by in terms of the number of students and their total score for each 
#     section, we cannot say for sure every student in either of the section has scored more points that the other.

# c.	What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions between the two sections?
#     Another variable that can be used or that can influence the point of distribution is ‘Sub Section’. 
#     If Regular and Sports sections are classified further into sub sections we can see the spread of 
#     point distributions for each section because the count will also vary based on the sub-section.


