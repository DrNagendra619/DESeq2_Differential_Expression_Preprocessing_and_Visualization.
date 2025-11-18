

# Step 1: Loading the packages
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(c("DESeq2", "ggplot2", "pheatmap"), ask = FALSE)

library(DESeq2)
library(ggplot2)
library(pheatmap)


# Step 2: Creating the demo count matrix
# Simulated gene expression counts for 6 samples (3 control, 3 treated)
counts <- matrix(
  c(400,380,410,800,850,870,  # Gene1
    50,45,69,200,220,210,     # Gene2
    600,620,590,610,630,600,  # Gene3
    1000,950,970,200,180,190, # Gene4
    300,310,290,100,120,110), # Gene5
  nrow = 5,
  byrow = TRUE
)

rownames(counts) <- paste0("Gene", 1:5)
colnames(counts) <- paste0("Sample", 1:6)
counts



# Step 3: Defining the sample conditions
condition <- factor(c("Control", "Control", "Control",
                      "Treated", "Treated", "Treated"))

coldata <- data.frame(row.names = colnames(counts), condition)


# Step 4: Creating the  DESeq2 dataset
dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = coldata,
                              design = ~ condition)


#Step 5: Running the  DESeq2 analysis
dds <- DESeq(dds)
res <- results(dds)
res <- res[order(res$padj), ]
res


# Step 6: Plotting the Volcano plot
res_df <- as.data.frame(res)
res_df$threshold <- as.factor(abs(res_df$log2FoldChange) > 1 & res_df$padj < 0.05)

ggplot(res_df, aes(x = log2FoldChange, y = -log10(padj), color = threshold)) +
  geom_point(size = 3, alpha = 0.7) +
  theme_minimal(base_size = 14) +
  scale_color_manual(values = c("grey", "red")) +
  labs(title = "Volcano Plot", x = "log2 Fold Change", y = "-log10(padj)")


# Step 7: Plotting the Heatmap of normalized counts
norm_counts <- counts(dds, normalized = TRUE)
pheatmap(log2(norm_counts + 1), annotation_col = coldata,
         main = "Normalized Expression Heatmap")



# Step 8: Summary
cat("Significant genes (padj < 0.05): ", sum(res_df$padj < 0.05, na.rm = TRUE), "\n")
















