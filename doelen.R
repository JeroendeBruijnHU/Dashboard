library(shiny)
library(plotly)
library(shinydashboard)
library(ggplot2)
library(base64enc)
library(rsconnect)


doelen <- function(input, output){
  
output$plot <- renderPlotly({
  plot_ly(data2, x = Datum) %>% 
    add_trace(y = score, mode = 'lines+markers',  
              marker = list(
                color = colorsValue,
                size = 15,
                line = list(
                  color = colorsValue,
                  width = 2
                )
              )
    ) %>%
    
    layout(
      title = list (
        text = "Sloeproeien",
        y = 0.9,
        x = 0.55,
        xanchor = 'center',
        yanchor = 'top'
      ),
      font= list(
        family="Courier New, monospace",
        size=18,
        color="#7f7f7f"
      ),
      images = list(
        list(
          x = 0.5, 
          y = 0.5, 
          xref = "paper", 
          yref = "paper", 
          layer = "below", 
          sizex = 0.9999999999999999, 
          sizey = 0.9999999999999997, 
          sizing = "fill", 
          source = paste("data:image/jpg;base64,", image),
          opacity = 0.2, 
          xanchor = "center", 
          yanchor = "middle"
        )
      ), 
      yaxis = list(
        dtick = 1, 
        tick0 = 1,
        showticklabels = FALSE,
        tickmode = "linear",
        fixedrange = TRUE
      ),
      xaxis = list(
        rangeselector = list(
          buttons = list(
            list(
              count = 7,
              label = "W",
              step = "day",
              stepmode = "backward",
              size = "10%" ),
            list(
              count = 1,
              label = "M",
              step = "month",
              stepmode = "backward"),
            list(
              count = 3,
              label = "3M",
              step = "month",
              stepmode = "backward"),
            list(
              count = 6,
              label = "6M",
              step = "month",
              stepmode = "backward"),
            list(
              count = 1,
              label = "Y",
              step = "year",
              stepmode = "backward"),
            list(
              count = 2,
              label = "2Y",
              step = "year",
              stepmode = "todate"),
            list(
              count = 1,
              label = "YTD",
              step = "year",
              stepmode = "todate"),
            list(step = "all"))),
        
        rangeslider = list(type = "date")
      ),
      dragmode = "pan"
    ) %>%
    
    plotly::config(displayModeBar = FALSE)
})

output$plot2 <- renderPlotly({
  plot_ly(data2, x = Datum) %>%
    add_trace(y = score1, mode = 'lines+markers',
              marker = list(
                color = colorsValue3,
                size = 15,
                line = list(
                  color = colorsValue3,
                  width = 2
                )
              )) %>%
    
    layout(
      title = list (
        text = "Vader zijn",
        y = 0.9,
        x = 0.55,
        xanchor = 'center',
        yanchor = 'top'
      ),
      font= list(
        family="Courier New, monospace",
        size=18,
        color="#7f7f7f"
      ),
      #line = list(shape = "linear", dash = "dot", width = 3),
      images = list(
        list(
          x = 0.5, 
          y = 0.5, 
          xref = "paper", 
          yref = "paper", 
          layer = "above", 
          sizex = 0.9999999999999999, 
          sizey = 0.9999999999999997, 
          sizing = "fill", 
          source = paste("data:image/jpg;base64,", imageVader),
          opacity = 0.2, 
          xanchor = "center", 
          yanchor = "middle"
        )
      ), 
      yaxis = list(
        dtick = 1, 
        tick0 = 1, 
        tickmode = "linear",
        showticklabels = FALSE,
        fixedrange = TRUE,
        range = c(0.5, 6)
      ),
      dragmode = "pan"
    ) %>%
    plotly::config(displayModeBar = FALSE)
})

output$plot3 <- renderPlotly({
  plot_ly(data2, x = Datum) %>%
    add_trace(y = score2, mode = 'lines+markers', 
              marker = list(
                color = colorsValue2,
                size = 15,
                line = list(
                  color = colorsValue2,
                  width = 2
                )
              )
    ) %>%
    
    layout(
      
      title = list (
        text = "Werken",
        y = 0.9,
        x = 0.55,
        xanchor = 'center',
        yanchor = 'top'
      ),
      font= list(
        family="SF UI Display - Medium",
        size=15,
        color="#7f7f7f"
      ),
      
      images = list(
        list(
          x = 0.5, 
          y = 0.5, 
          xref = "paper", 
          yref = "paper", 
          layer = "above", 
          sizex = 0.9999999999999999, 
          sizey = 0.9999999999999997, 
          sizing = "fill", 
          source = paste("data:image/jpg;base64,", imageWerk),
          opacity = 0.2, 
          xanchor = "center", 
          yanchor = "middle"
        )
      ), 
      yaxis = list(
        dtick = 1, 
        tick0 = 1, 
        showticklabels = FALSE,
        tickmode = "linear",
        fixedrange = TRUE
      ),
      dragmode = "pan"
    ) %>%
    plotly::config(displayModeBar = FALSE)
})

}

