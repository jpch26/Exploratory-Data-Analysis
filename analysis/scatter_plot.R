# Packages
library(ggplot2)

# 1 Simulating data
set.seed(5)

gene_1 <- rnorm(500, mean = 20, sd = 5)
gene_2 <- gene_1 + rnorm(500, mean = 10, sd = 5)

data_gene <- data.frame(
  gene_1,
  gene_2
)

# 2 Scatter Plot
scatter_gene <- ggplot(data_gene, aes(gene_1, gene_2)) +
  geom_point() +
  xlab("Relative expression gene 1") +
  ylab("Relative expression gene 2") +
  theme_classic()

# 3 Save Plot
ggsave(filename = "graphs/scatter_plot_genes.jpeg", plot = scatter_gene)