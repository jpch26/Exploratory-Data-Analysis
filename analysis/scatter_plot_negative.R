# Packages
library(ggplot2)

# 1 Simulating data
set.seed(1)

gene_1 <- rnorm(500, mean = 20, sd = 5)
gene_3 <- 100 * (1/(gene_1 * rnorm(500, mean = 0.5, sd = 0.1)))

data_gene <- data.frame(
  gene_1,
  gene_3
)

# 2 Scatter Plot
scatter_gene_neg <- ggplot(data_gene, aes(gene_1, gene_3)) +
  geom_point() +
  xlab("Relative expression gene 1") +
  ylab("Relative expression gene 3") +
  theme_classic()

# 3 Save Plot
ggsave(filename = "graphs/scatter_plot_genes_negative.jpeg", 
       plot = scatter_gene_neg)