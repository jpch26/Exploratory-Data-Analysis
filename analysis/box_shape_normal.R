# Packages
library(ggplot2)
library(ggpubr)

# 1 Simulating the data
set.seed(5)

data_norm <- rnorm(100, mean = 50, sd = 3)

# 2 Box plot
box_norm <- ggplot(data = data.frame(data_norm), aes(x = data_norm, y = " ")) +
  geom_boxplot() +
  ylab(" ") +
  xlim(c(40, 60)) +
  theme_classic()

# 3 Histogram
hist_norm <- ggplot(data = data.frame(data_norm), aes(x = data_norm)) +
  geom_histogram(color = "black", fill = "white", binwidth = 2) +
  xlim(c(40, 60)) +
  theme_classic()

# 4 Arrange both plots
box_hist_norm <- ggarrange(box_norm, hist_norm, nrow = 2)

# 5 Save plot
ggsave(filename = "graphs/boxhist_norm.jpeg", plot = box_hist_norm)
