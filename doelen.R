library(shiny)
library(plotly)
library(shinydashboard)
library(ggplot2)
library(base64enc)
library(rsconnect)




doelen <- function(input, output){
  
#Auto color functie
colorsValue <- c()
colorAsignment <- function(scorereeks) {
  for (waarde in scorereeks) {
    if (waarde == 1) {
      colorsValue <- c(colorsValue, "rgb(255, 91, 25)")
    }
    else if (waarde == 2) {
      colorsValue <- c(colorsValue, "rgb(255, 161, 26)")
    } 
    else if (waarde == 3) {
      colorsValue <- c(colorsValue, "rgb(255, 214, 3)")
    } 
    else if (waarde == 4) {
      colorsValue <- c(colorsValue, "rgb(209, 204, 25)")
    } 
    else if (waarde == 5) {
      colorsValue <- c(colorsValue, "rgb(104, 190, 120)")
    } 
  }
  print(colorsValue)
  return(colorsValue)
}  
  
output$plot <- renderPlotly({
  plot_ly(data2, x = Datum) %>% 
    add_trace(y = score, mode = 'lines+markers',  
              marker = list(
                color = colorAsignment(score),
                size = 15,
                line = list(
                  color = colorAsignment(score),
                  width = 2
                )
              )
    ) %>%
    
    add_trace(y = scoreLeeg,x = DatumLeeg, mode = 'lines+markers',  
              line = list(dash = 'dash'),
              marker = list(
                color = colorAsignment(scoreLeeg),
                size = 15,
                line = list(
                  color = colorAsignment(scoreLeeg),
                  width = 2
                )
              )
    ) %>%
    
    layout(
      showlegend=FALSE,
      title = list (
        text = "Sloeproeien",
        y = 0.85,
        x = 0.55,
        xanchor = 'center',
        yanchor = 'top'
      ),
      font= list(
        family="American Typewriter",
        size=15,
        color="#7D7771"
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
        fixedrange = TRUE,
        range = c(0.5, 6)
      ),
      xaxis = list(
        range = "normal",
        rangeselector = list(
          buttons = list(
            list(
              count = 7,
              label = "1W",
              step = "day",
              stepmode = "backward",
              size = "10%" ),
            list(
              count = 1,
              label = "1M",
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
              label = "1J",
              step = "year",
              stepmode = "backward"),
            list(
              count = 2,
              label = "2J",
              step = "year",
              stepmode = "todate"))),
        
        # rangeslider = list(type = "date")
        FALSE
      ),
      dragmode = "pan"
    ) %>%
    
    plotly::config(displayModeBar = FALSE)
})

output$plot2 <- renderPlotly({
  plot_ly(data2, x = Datum) %>%
    add_trace(y = score1, mode = 'lines+markers',
              marker = list(
                color = colorAsignment(score1),
                size = 15,
                line = list(
                  color = colorAsignment(score1),
                  width = 2
                )
              )) %>%
    
    layout(
      title = list (
        text = "Vader zijn",
        y = 0.85,
        x = 0.55,
        xanchor = 'center',
        yanchor = 'top'
      ),
      font= list(
        family="American Typewriter",
        size=15,
        color="#7D7771"
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
      xaxis = list(
        rangeselector = list(
          buttons = list(
            list(
              count = 7,
              label = "1W",
              step = "day",
              stepmode = "backward",
              size = "10%" ),
            list(
              count = 1,
              label = "1M",
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
              label = "1J",
              step = "year",
              stepmode = "backward"),
            list(
              count = 2,
              label = "2J",
              step = "year",
              stepmode = "todate"))),
        
        # rangeslider = list(type = "date")
        FALSE
      ),
      dragmode = "pan"
    ) %>%
    plotly::config(displayModeBar = FALSE)
})

output$plot3 <- renderPlotly({
  plot_ly(data2, x = Datum) %>%
    add_trace(y = score2, mode = 'lines+markers', 
              marker = list(
                color = colorAsignment(score2),
                size = 15,
                line = list(
                  color = colorAsignment(score2),
                  width = 2
                )
              )
    ) %>%
    
    layout(
      font= list(
        family="American Typewriter",
        size=15,
        color="#7D7771"
      ),
      title = list (
        text = "Werken",
        y = 0.85,
        x = 0.55,
        xanchor = 'center',
        yanchor = 'top'
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
        fixedrange = TRUE,
        range = c(0.5, 6)
      ),
      xaxis = list(
        rangeselector = list(
          buttons = list(
            list(
              count = 7,
              label = "1W",
              step = "day",
              stepmode = "backward",
              size = "10%" ),
            list(
              count = 1,
              label = "1M",
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
              label = "1J",
              step = "year",
              stepmode = "backward"),
            list(
              count = 2,
              label = "2J",
              step = "year",
              stepmode = "todate"))),
        
        # rangeslider = list(type = "date")
        FALSE
      ),
      dragmode = "pan"
    ) %>%
    plotly::config(displayModeBar = FALSE)
})

}

