library(shiny)
library(plotly)
library(shinydashboard)
library(ggplot2)
library(base64enc)
library(rsconnect)



metingen <- function(input, output){
  
  output$meting <- renderPlotly({
    plot_ly(dataStappen, x = ~Datum) %>%
      add_trace(y = stappen, mode = 'lines+markers') %>%
      
      layout(
        yaxis = list(
          dtick = 1000, 
          tick0 = 0, 
          fixedrange = TRUE
        ),
        dragmode = "pan"
      ) %>%
      plotly::config(displayModeBar = FALSE)
  })
  
  output$meting2 <- renderPlotly({
    plot_ly(dataTemp, x = ~Datum) %>%
      add_trace(y = temperatuur, name = 'test', mode = 'lines+markers') %>%
      
      layout(
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
            opacity = 0.2, 
            xanchor = "center", 
            yanchor = "middle"
          )
        ), 
        yaxis = list(
          dtick = 1, 
          tick0 = 1, 
          tickmode = "linear",
          fixedrange = TRUE
        ),
        dragmode = "pan"
      ) %>%
      plotly::config(displayModeBar = FALSE)
  })
}
