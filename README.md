# DESeq2_Differential_Expression_Preprocessing_and_Visualization.
DESeq2_Differential_Expression_Preprocessing_and_Visualization.
# 🔬 DESeq2 DGE Core Workflow: Preprocessing and Visualization (Simulated Data)

This R script provides a fundamental and illustrative pipeline for demonstrating the core steps of **Differential Gene Expression (DGE)** analysis using simulated RNA-Seq count data and the **`DESeq2`** package.

The workflow simulates a simple Control vs. Treated experiment, performs the DGE calculation, and generates essential visualizations to interpret the results.

## 🚀 Key Features

* **Simulated Data:** Creates a small, manually-defined count matrix (5 genes, 6 samples) to clearly illustrate the input requirements of `DESeq2`.
* **DESeq2 Core Workflow:** Implements the fundamental steps for `DESeqDataSet` creation and the main `DESeq()` analysis function.
* **Volcano Plot:** Generates a **Volcano Plot** ($\log_2 \text{FC}$ vs. $-\log_{10}(\text{padj})$) to visually identify significantly differentially expressed genes (DEGs).
* **Expression Heatmap:** Generates a **Heatmap** of the $\log_2$-transformed normalized counts, showing the expression patterns across the Control and Treated samples.
* **Minimal Dependencies:** Relies only on `DESeq2`, `ggplot2`, and `pheatmap`.

---

## 🔬 Analysis Overview

| Component | Method / Test | Purpose |
| :--- | :--- | :--- |
| **Data** | Simulated Count Matrix | Provides a small, controlled example for teaching DESeq2 setup. |
| **DGE Tool** | `DESeq2` | Statistical analysis method optimized for count data. |
| **Normalization** | **Median of Ratios** (within `DESeq2`) | Corrects for sequencing depth and RNA composition differences. |
| **Comparison** | Treated vs. Control | Identifies differences in gene expression between the two simulated groups. |

---

## 🛠️ Prerequisites and Setup

### 📦 Packages

The script automatically installs and loads the necessary packages:
* `DESeq2`
* `ggplot2`
* `pheatmap`

### ⚙️ Execution

1.  **Download** the `DESeq2_Differential_Expression_Preprocessing_and_Visualization.R` file.
2.  **Execute** the script in your R environment:
    ```R
    source("DESeq2_Differential_Expression_Preprocessing_and_Visualization.R")
    ```
    *Note: The results table and DEG count will be printed to the console, and the plots will be displayed in the R graphics device.*

---

## 📊 Output and Interpretation

The script performs a quick DGE analysis on the 5 simulated genes. Given the structure of the count matrix (Gene1, Gene2, Gene4, and Gene5 show large differences between Control and Treated), the final console output should indicate that most of these genes are significant:
### Visualization

The script generates the following two plots:

1.  **Volcano Plot:** Visually demonstrates the calculated $\log_2 \text{Fold Change}$ (x-axis) and statistical significance (y-axis). Points satisfying the significance thresholds ($\text{padj} < 0.05$ and $|\log_2 \text{FC}| > 1$) are colored in **red**.
2.  **Normalized Expression Heatmap:** Shows the cluster separation between **Control** and **Treated** samples based on the $\log_2$-transformed normalized counts. The genes with opposite regulation (e.g., Gene4 and Gene5 being downregulated in Treated) should clearly cluster.
