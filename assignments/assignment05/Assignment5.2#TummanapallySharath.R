# Assignment: ASSIGNMENT 5.2
# Name: Tummanapally, Sharath Chandra
# Date: 2021-10-01

library(readxl)
library(plyr)
library(dplyr)

# Loading Housing dataset.
housing_df <- read_excel('data/week-7-housing.xlsx')

# 1.	Using either the same dataset(s) you used in the previous weeks’ exercise or a brand-new dataset of your choosing, perform the following transformations (Remember, anything you learn about the Housing dataset in these two weeks can be used for a later exercise!)
# a.	Using the dplyr package, use the 6 different operations to analyze/transform the data - GroupBy, Summarize, Mutate, Filter, Select, and Arrange – Remember this isn’t just modifying data, you are learning about your data also – so play around and start to understand your dataset in more detail

# Using GroupBy operation, getting the max sale price by site type.
housing_df %>% group_by(sitetype) %>% dplyr::summarize(AvgPrice = max(`Sale Price`))

# Using Summarize operation, getting the average sale price , median sale price and maximum sq ft lot. 
summarize(housing_df, AvgPrice=mean(`Sale Price`), MedianPrice=median(`Sale Price`), maxSqft=max(sq_ft_lot))

# Using Mutate operation, adding the new 'site_area_occupied' column to housing date frame.
housing_df %>% select(`Sale Date`,sitetype, sq_ft_lot, square_feet_total_living)  %>% mutate(site_area_occupied = sq_ft_lot/square_feet_total_living)

# Using Filter operation, getting the housing data from data frame for the site type's A1,C1.
housing_df %>% filter(sitetype %in% c('A1','C1'))

# Using Select function, getting sale date, sale price, address and square feet of lot from housing data frame.
housing_df %>% select(`Sale Date`, `Sale Price`, addr_full, sq_ft_lot)

# Using Arrange operation, sorting the columns by average price. 
housing_df %>% group_by(sitetype) %>% dplyr::summarize(AvgPrice = max(`Sale Price`)) %>% arrange(AvgPrice)

# b.	Using the purrr package – perform 2 functions on your dataset.  You could use zip_n, keep, discard, compact, etc.
library(purrr)

housing_df_sample <- head(housing_df)

# using keep function, getting values sale price greater than 600000.  
keep(housing_df_sample$`Sale Price`, function(x) x > 600000)

# using discard function, removing all NA values from sale warning.
discard(housing_df_sample$sale_warning, is.na)

# c.	Use the cbind and rbind function on your dataset

# creating two data frames from housing data frame.
housing_df1 <- select(housing_df, `Sale Date`, `Sale Price`, addr_full, sq_ft_lot)
housing_df2 <- select(housing_df, zip5, ctyname)
# using cbind function.
cbind(housing_df1, housing_df2)

# using rbind function.
housing_df3 <- head(housing_df2)
c1 <- c(60090, 'Wheeling')
rbind(housing_df3, c1)

# d.	Split a string, then concatenate the results back together
str <- "Hello! Welcome to programming."
lst <- strsplit(str, " ")
paste(unlist(lst), collapse = " ")

