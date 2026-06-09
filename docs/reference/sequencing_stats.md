# Sequencing Stats

Generates a table containing general run metrics from a sequencing
summary: sample ID, duration in hours, number of reads, total bases
sequenced in Gb, percentage of passed reads, and average sequencing
speed in bp/s.

## Usage

``` r
sequencing_stats(seq_summary)
```

## Arguments

- seq_summary:

  A dataframe containing the sequencing summary

## Value

A dataframe with general run metrics

## Examples

``` r
sequencing_stats(sample_data)
#> # A tibble: 1 × 6
#>   `sample id`     `duration [h]` `number of reads` `total bases sequenced [Gb]`
#>   <chr>                    <dbl>             <int>                        <dbl>
#> 1 experiment_0001           88.6              1000                        0.001
#> # ℹ 2 more variables: `passed reads [%]` <dbl>, `average speed [bp/s]` <dbl>
```
