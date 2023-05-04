# load the Iris dataset
data(iris)

# (i) Find dimension, Structure, Summary statistics, Standard Deviation of all features.
# dimension
cat("Dimension of Iris dataset:", dim(iris), "\n")

# structure
cat("\nStructure of Iris dataset:\n")
str(iris)

# summary statistics
cat("\nSummary statistics of Iris dataset:\n")
summary(iris)

# standard deviation of all features
cat("\nStandard deviation of all features:\n")
sapply(iris[,1:4], sd)

# (ii) Find mean and standard deviation of features grouped by three species of Iris flowers
# mean and standard deviation by species
cat("\nMean and standard deviation of features grouped by species:\n")
aggregate(iris[,1:4], by=list(Species=iris$Species), FUN=mean)
aggregate(iris[,1:4], by=list(Species=iris$Species), FUN=sd)

# (iii) Find quantile value of sepal width and length
# quantile value of sepal width and length
cat("\nQuantile value of sepal width and length:\n")
quantile(iris$Sepal.Width)
quantile(iris$Sepal.Length)

# (iv) Create new data frame named iris1 which have a new column name Sepal.Length.Cate that categorizes “Sepal.Length” by quantile
# create new column with Sepal.Length.Cate
iris1 <- iris
iris1$Sepal.Length.Cate <- cut(iris$Sepal.Length, breaks=quantile(iris$Sepal.Length))
cat("\nNew data frame iris1 with Sepal.Length.Cate column:\n")
head(iris1)

# (v) Average value of numerical variables by two categorical variables: Species and Sepal.Length.Cate
# average value by species and Sepal.Length.Cate
cat("\nAverage value of numerical variables by Species and Sepal.Length.Cate:\n")
aggregate(iris1[,1:4], by=list(Species=iris1$Species, Sepal.Length.Cate=iris1$Sepal.Length.Cate), FUN=mean)

# (vi) Average mean value of numerical variables by Species and Sepal.Length.Cate
# average mean value by species and Sepal.Length.Cate
cat("\nAverage mean value of numerical variables by Species and Sepal.Length.Cate:\n")
aggregate(iris1[,1:4], by=list(Species=iris1$Species, Sepal.Length.Cate=iris1$Sepal.Length.Cate), FUN=function(x) mean(x))

# (vii) Create Pivot Table based on Species and Sepal.Length.Cate
# pivot table by species and Sepal.Length.Cate
cat("\nPivot Table based on Species and Sepal.Length.Cate:\n")
library(tidyr)
library(dplyr)
iris1 %>% pivot_longer(-c(Species, Sepal.Length.Cate)) %>% group_by(Species, Sepal.Length.Cate, name) %>% summarise(mean = mean(value))
