## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment  = "#>",
  message  = FALSE,
  warning  = FALSE
)

## ----install, eval = FALSE----------------------------------------------------
# # install.packages("devtools")
# devtools::install_github("All-ice0/NanoQuRe")

## ----load-real, eval = FALSE--------------------------------------------------
# seq_summary <- read.csv("sequencing_summary.txt", sep = "\t")
# 
# # passes_filtering comes in as a string from some basecallers — coerce if needed
# seq_summary$passes_filtering <- as.logical(seq_summary$passes_filtering)

## ----load-data----------------------------------------------------------------
library(NanoQuRe)

data(sample_data)

## ----generate-report, eval = FALSE--------------------------------------------
# generate_report(sample_data, output_file = "my_QC_report.html")

## ----multi-sample, eval = FALSE-----------------------------------------------
# generate_report(sample_data_A, sample_data_B, output_file = "multi_QC_report.html")

## ----session-info-------------------------------------------------------------
sessionInfo()

