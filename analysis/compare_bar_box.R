# Packages 
library(ggplot2)
library(ggpubr)
library(dplyr)

# 1 Simulate the data
set.seed(5)

group_1 <- rnorm(10, mean = 30, sd = 4.8)
group_2 <- rnorm(10, mean = 38, sd = 6)

data_groups <- data.frame(
  Group = rep(c("1", "2"), each = 10),
  Value = c(group_1, group_2)
)

# 2 Barplot
bar_plot <- data_groups %>% 
  group_by(Group) %>% 
  summarise(
    Average = mean(Value),
    SD      = sd(Value)
    ) %>% 
  ggplot(aes(x = Group, y = Average)) +
  geom_col(color = "black", fill = "white", width = 0.4) +
  geom_errorbar(aes(ymin = Average - SD, ymax = Average + SD), width = 0.1) +
  theme_classic()

# 3 Boxplot
box_plot <- data_groups %>% 
  ggplot(aes(x = Group, y = Value)) +
  geom_boxplot(outlier.color = "red", outlier.size = 5, outlier.shape = 7) +
  geom_point(size = 1.5) +
  theme_classic()

# 4 Put both plots in the same figure
barbox_plot <- ggarrange(bar_plot, box_plot, nrow = 2)

# 5 Save the plot
ggsave(filename = "graphs/bar_box_plots.jpeg", plot = barbox_plot)