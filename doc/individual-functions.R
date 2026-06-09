## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment  = "#>",
  message  = FALSE,
  warning  = FALSE
)

## ----load-data----------------------------------------------------------------
library(NanoQuRe)

data(sample_data)

## ----sequencing-stats---------------------------------------------------------
sequencing_stats(sample_data)

## ----quality-stats------------------------------------------------------------
quality_stats(sample_data)

## ----cumulative-yield---------------------------------------------------------
plot_cumulative_yield(sample_data)

## ----seq-throughput-----------------------------------------------------------
plot_seq_throughput(sample_data)

## ----average-speed------------------------------------------------------------
plot_average_speed(sample_data)

## ----read-lengths-------------------------------------------------------------
# default upper limit is 4000 bp
plot_read_lengths(sample_data)

## ----read-lengths-custom, eval = FALSE----------------------------------------
# # zoom out to see the full long-read tail
# plot_read_lengths(sample_data, upper_limit = 20000)

## ----quality-distribution-----------------------------------------------------
# default user-defined cutoff is Q7
plot_quality_distribution(sample_data, qscore_cutoff = 7)

## ----active-channels----------------------------------------------------------
plot_active_channels(sample_data)

## ----pore-heatmap-------------------------------------------------------------
pore_activity_heatmap(sample_data, platform = "minion")

## ----n50----------------------------------------------------------------------
calculate_n50(sample_data)

## ----session-info-------------------------------------------------------------
sessionInfo()

