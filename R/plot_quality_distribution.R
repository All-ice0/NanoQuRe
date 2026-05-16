#' Plot Quality Distribution
#'
#' Generates an interactive plot with number of reads at each Q score sorted
#' by pass/fail filtering status. Vertical line represents Q score cut-off
#' which is by default equal to 7. The basecaller threshold line is only drawn
#' when failing reads are present in the data.
#'
#' @param seq_summary A dataframe containing the sequencing summary
#' @param qscore_cutoff Numeric parameter of Qscore cut-off
#'
#' @returns plotly object
#' @import dplyr
#' @importFrom plotly plot_ly add_bars add_lines layout
#' @importFrom assertthat assert_that
#' @export
#'
#' @examples
#' NULL
plot_quality_distribution <- function(seq_summary, qscore_cutoff = 7) {
  
  # --- Validation ---
  qscore_cutoff <- as.numeric(qscore_cutoff)
  assertthat::assert_that(nrow(seq_summary) > 0,
                          msg = "The input data frame is empty.")
  assertthat::assert_that(assertthat::has_name(seq_summary, "sequence_length_template"),
                          msg = "The data frame is missing the 'sequence_length_template' column")
  assertthat::assert_that(assertthat::has_name(seq_summary, "sample_id"),
                          msg = "Missing 'sample_id' column")
  assertthat::assert_that(assertthat::has_name(seq_summary, "mean_qscore_template"),
                          msg = "The data frame is missing the 'mean_qscore_template' column")
  assertthat::assert_that(assertthat::has_name(seq_summary, "passes_filtering"),
                          msg = "The data frame is missing the 'passes_filtering' column")
  assertthat::assert_that(is.numeric(seq_summary$mean_qscore_template),
                          msg = "Q-score column must be numeric")
  assertthat::assert_that(!is.na(qscore_cutoff),
                          msg = "qscore_cutoff must be a number")
  
  # --- Data prep ---
  sample_name <- dplyr::first(seq_summary$sample_id)
  binwidth    <- 0.15
  bins        <- seq(-0.1, 15.1, by = binwidth)
  
  # y axis ceiling — 50% of total reads gives a readable scale in typical runs
  max_y <- nrow(seq_summary) * 0.05
  
  # Bin all reads once, then split by pass/fail
  binned <- seq_summary %>%
    dplyr::mutate(
      bin     = cut(mean_qscore_template, breaks = bins,
                    right = FALSE, include.lowest = TRUE),
      bin_mid = bins[as.integer(bin)] + binwidth / 2
    )
  
  pass_data <- binned %>%
    dplyr::filter(passes_filtering == TRUE) %>%
    dplyr::count(bin, bin_mid)
  
  fail_data <- binned %>%
    dplyr::filter(passes_filtering == FALSE) %>%
    dplyr::count(bin, bin_mid)
  
  # Basecaller boundary — only computed when failing reads exist,
  # guards against empty vector passed to max() returning -Inf
  fail_scores         <- seq_summary$mean_qscore_template[seq_summary$passes_filtering == FALSE]
  basecaller_boundary <- if (length(fail_scores) > 0) max(fail_scores, na.rm = TRUE) else NULL
  
  # --- Plot ---
  qual_plot <- suppressWarnings(plotly::plot_ly() %>%
    plotly::add_bars(
      data          = fail_data,
      x             = ~bin_mid,
      y             = ~n,
      name          = "Fail",
      marker        = list(
        color = "#D62728",
        line  = list(width = 0)
      ),
      hovertemplate = "Q score: %{x:.2f}<br>Count: %{y}<extra>Fail</extra>"
    ) %>%
    plotly::add_bars(
      data          = pass_data,
      x             = ~bin_mid,
      y             = ~n,
      name          = "Pass",
      marker        = list(
        color = "#0072B2",
        line  = list(width = 0)
      ),
      hovertemplate = "Q score: %{x:.2f}<br>Count: %{y}<extra>Pass</extra>"
    ) %>%
    # User-defined cutoff — set by the researcher for downstream analysis
    plotly::add_lines(
      x             = c(qscore_cutoff, qscore_cutoff),
      y             = c(0, max_y),
      name          = paste0("User-defined cut-off: Q", qscore_cutoff),
      line          = list(color = "#E69F00", width = 2.5, dash = "dash"),
      hovertemplate = paste0(
        "User-defined cut-off: Q", qscore_cutoff,
        "<br>Reads below basecaller threshold but above this line<br>",
        "may be recoverable for analysis.<extra></extra>"
      )
    ) %>%
    # Basecaller boundary — only added when failing reads are present
    { if (!is.null(basecaller_boundary))
      plotly::add_lines(.,
                        x             = c(basecaller_boundary, basecaller_boundary),
                        y             = c(0, max_y),
                        name          = paste0("Basecaller threshold: Q", round(basecaller_boundary, 2)),
                        line          = list(color = "#612a78", width = 2.5),
                        hovertemplate = paste0(
                          "Basecaller pass/fail boundary: Q", round(basecaller_boundary, 2),
                          "<extra></extra>"
                        )
      )
      else . } %>%
    plotly::layout(
      barmode = "stack",
      title = list(
        text = paste0("<b>", sample_name, "</b>"),
        x    = 0.5,
        font = list(size = 15, color = "#333333", family = "Arial")
      ),
      xaxis = list(
        title     = list(text = "<b>Mean Q score of read</b>",
                         font = list(size = 13, family = "Arial")),
        range     = c(-0.1, 15),
        showgrid  = TRUE,
        gridcolor = "#e0e0e0",
        tickfont  = list(size = 11, family = "Arial", color = "#333333")
      ),
      yaxis = list(
        title     = list(text = "<b>Number of reads</b>",
                         font = list(size = 13, family = "Arial")),
        showgrid  = TRUE,
        gridcolor = "#e0e0e0",
        tickfont  = list(size = 11, family = "Arial", color = "#333333")
      ),
      plot_bgcolor  = "#f9f9f9",
      paper_bgcolor = "#f9f9f9",
      legend = list(
        bgcolor     = "#ffffff",
        bordercolor = "#cccccc",
        borderwidth = 1,
        font        = list(size = 11, family = "Arial"),
        x           = 0.75,
        y           = 0.95
      )
    ) %>%
    plotly::config(displayModeBar = "hover"))
  
  return(qual_plot)
}