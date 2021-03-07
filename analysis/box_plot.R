# Packages
library(ggplot2)

# 1 Simulating data
set.seed(5)

group_1 <- rnorm(30, mean = 25, sd = 1)
group_2 <- rnorm(30, mean = 23, sd = 1)

data_groups <- data.frame(
  Group = rep(c("1", "2"), each = 30), 
  Value = c(group_1, group_2)
  )

# 2 Box Plot
boxplot_groups <- ggplot(data = data_groups, aes(x = Group, y = Value)) +
  geom_boxplot(width = 0.5) +
  theme_classic()

# 3 Save plot
ggsave(filename = "graphs/boxplot.jpeg", plot = boxplot_groups)