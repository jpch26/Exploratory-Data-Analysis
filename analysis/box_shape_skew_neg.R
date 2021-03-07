# Packages
library(ggplot2)
library(ggpubr)
library(sn)      # simulate skew-normal distribution

# 1 Simulating the data
set.seed(5)

data_rsn <- rsn(100, xi = 50, alpha = 40, omega = -10)

# 2 Box plot
box_rsn <- ggplot(data = data.frame(data_rsn), aes(x = data_rsn, y = " ")) +
  geom_boxplot() +
  ylab(" ") +
  theme_classic()

# 3 Histogram
hist_rsn <- ggplot(data = data.frame(data_rsn), aes(x = data_rsn)) +
  geom_histogram(color = "black", fill = "white", bins = 10) + 
  theme_classic()

# 4 Arrange both plots
box_hist_rsn <- ggarrange(box_rsn, hist_rsn, nrow = 2)

# 5 Save plot
ggsave(filename = "graphs/boxhist_skew_neg.jpeg", plot = box_hist_rsn)