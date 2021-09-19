library(ggplot2)
# install.packages("pastecs")
library(pastecs)

theme_set(theme_minimal())
setwd("/Users/sharath/dsc520_SharathTummanapally")
## Load the `assignments/assignment03/acs-14-1yr-s0201.csv`
acs14_df <- read.csv("assignments/assignment03/acs-14-1yr-s0201.csv")

str(acs14_df)
nrow(acs14_df)
ncol(acs14_df)

library(ggplot2)
# install.packages("pastecs")
library(pastecs)

ggplot(acs14_df, aes(sample=HSDegree)) + geom_qq()


n_obs = sum(!is.na(acs14_df$HSDegree))
ybreaks = seq(0,50,5)
ggplot(acs14_df, aes(HSDegree))  + ggtitle('High School Degree') + xlab('Grade') + ylab('No. of people') + 
  geom_histogram(aes(y = ..density..), bins = 10) + 
  stat_function(fun = dnorm, args = list(mean = mean(acs14_df$HSDegree), sd = sd(acs14_df$HSDegree))) +
  scale_y_continuous("No. of people", breaks = round(ybreaks / (3 * n_obs),3), labels = ybreaks)
  
                                        
stat.desc(heights_df, basic=TRUE, desc=TRUE, norm=FALSE, p=0.95)


#install.packages("moments")
library(moments) 
skewness(acs14_df$HSDegree)

a.z <- (acs14_df$HSDegree-mean(acs14_df$HSDegree))/sd(acs14_df$HSDegree)
plot(a.z, type="o", col="green")
pnorm(a.z)



