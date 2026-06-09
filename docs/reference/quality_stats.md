# Quality Stats

Generates a table containing the most important quality metrics from a
sequencing summary: number of all reads, number of passed reads, N50
value, mean Q-score, longest read length, and mean length of passed
reads.

## Usage

``` r
quality_stats(seq_summary)
```

## Arguments

- seq_summary:

  A dataframe containing the sequencing summary

## Value

A dataframe with quality metrics for the sequencing run

## Examples

``` r
quality_stats(sample_data)
#> # A tibble: 1 × 7
#>   `sample id`     `all reads` `passed reads` `n50 value` `mean qscore`
#>   <chr>                 <int>          <int>       <dbl>         <dbl>
#> 1 experiment_0001        1000            885        1201          10.9
#> # ℹ 2 more variables: `longest read` <dbl>, `passed mean length` <dbl>
```
