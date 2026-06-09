# Plot Seq Throughput

Generates an interactive plot with sequence throughput during time
filtered by pass/fail status.

## Usage

``` r
plot_seq_throughput(seq_summary)
```

## Arguments

- seq_summary:

  A dataframe containing the sequencing summary

## Value

plotly object

## Examples

``` r
plot_seq_throughput(sample_data)

{"x":{"visdat":{"3c2abf44d83add":["function () ","plotlyVisDat"],"3c2abf73036e09":["function () ","data"],"3c2abf37204342":["function () ","data"]},"cur_data":"3c2abf37204342","attrs":{"3c2abf73036e09":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"type":"scatter","mode":"lines","name":"Pass","line":{"color":"#0072B2","width":2.5},"hovertemplate":"Time: %{x} h<br>Yield: %{y:.3f} Gb<extra>Pass<\/extra>","inherit":true},"3c2abf37204342":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"type":"scatter","mode":"lines","name":"Fail","line":{"color":"#D62728","width":2.5},"hovertemplate":"Time: %{x} h<br>Yield: %{y:.3f} Gb<extra>Fail<\/extra>","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":{"text":"<b>experiment_0001<\/b>","x":0.5,"font":{"size":15,"color":"#333333","family":"Arial"}},"xaxis":{"domain":[0,1],"automargin":true,"title":{"text":"<b>Time [h]<\/b>","font":{"size":13,"family":"Arial"}},"showgrid":true,"gridcolor":"#e0e0e0","tickfont":{"size":11,"family":"Arial","color":"#333333"}},"yaxis":{"domain":[0,1],"automargin":true,"title":{"text":"<b>Yield per hour [Gb]<\/b>","font":{"size":13,"family":"Arial"}},"showgrid":true,"gridcolor":"#e0e0e0","tickfont":{"size":11,"family":"Arial","color":"#333333"}},"plot_bgcolor":"#f9f9f9","paper_bgcolor":"#f9f9f9","legend":{"x":1.02,"y":1,"xanchor":"left","bgcolor":"#ffffff","bordercolor":"#cccccc","borderwidth":1,"font":{"size":11,"family":"Arial"}},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[0,88],"y":[0.00036622400000000001,0.00034835299999999998],"type":"scatter","mode":"lines","name":"Pass","line":{"color":"#0072B2","width":2.5},"hovertemplate":["Time: %{x} h<br>Yield: %{y:.3f} Gb<extra>Pass<\/extra>","Time: %{x} h<br>Yield: %{y:.3f} Gb<extra>Pass<\/extra>"],"marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[0,88],"y":[1.9556e-05,0.00034882400000000002],"type":"scatter","mode":"lines","name":"Fail","line":{"color":"#D62728","width":2.5},"hovertemplate":["Time: %{x} h<br>Yield: %{y:.3f} Gb<extra>Fail<\/extra>","Time: %{x} h<br>Yield: %{y:.3f} Gb<extra>Fail<\/extra>"],"marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}
```
