# Packages
library(ggplot2)

# 1 Simulate data from a normal distribution
set.seed(5)

data_norm <- rnorm(30, mean = 20, sd = 2)
data_norm <- round(data_norm, 2)

# 2 Sort from lowest to highest 
data_norm <- sort(data_norm)

# 3 Set a number for each datum 
number <- order(data_norm)

# 4 Calculate the position as a function of the number in the data set with 
#   the equation (i-0.5)/N where i is the number and N the is total number of data.
pos <- (number - 0.5) / length(number)

# 5 Obtain the quantiles from a normal distribution with mean = 0 and sd = 1
qt <- qnorm(pos)

# 6 Plot the position vs the the normal quantiles
qq_plot <- ggplot(data = data.frame(data_norm, qt), aes(qt, data_norm)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  xlab("Normal quantile") +
  ylab("Original data") +
  theme_classic()

# 7 Save the plot
ggsave(filename = "graphs/qq_plot.jpeg", plot = qq_plot)