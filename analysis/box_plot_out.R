# Packages
library(ggplot2)

# 1 Simulating data
set.seed(5)

group_1 <- rnorm(30, mean = 25, sd = 1)
group_2 <- rnorm(30, mean = 23, sd = 1)

# outliers
outliers_group1 <- c(rnorm(5, mean = 20), rnorm(5, mean = 33))
outliers_group2 <- c(rnorm(5, mean = 15), rnorm(5, mean = 30))

data_groups <- data.frame(
  Group = rep(c("1", "2"), each = 40), 
  Value = c(group_1, outliers_group1, group_2, outliers_group2)
  )

# 2 Box Plot
boxplot_groups_outlier <- ggplot(data = data_groups, aes(x = Group, y = Value)) +
  geom_boxplot(width = 0.5, outlier.color = "red") +
  theme_classic()

# 3 Save plot 
ggsave(filename = "graphs/boxplot_outliers.jpeg", plot = boxplot_groups_outlier)