library(shiny)
library(plotly)
library(shinydashboard)
library(ggplot2)
library(base64enc)
library(rsconnect)

symptomen <- function(input, output){
  
  output$symptoom1 <- renderPlotly({
    plot_ly(data2, x = Datum) %>% 
      add_trace(y = score3, mode = 'lines+markers') %>%
      
      layout(
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
  
  
  output$symptoom2 <- renderPlotly({
    plot_ly(data2, x = ~Datum) %>%
      add_trace(y = score4, mode = 'lines+markers') %>%
      
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
  
  output$symptoom3 <- renderPlotly({
    plot_ly(data2, x = ~Datum) %>%
      add_trace(y = score5, name = 'test', mode = 'lines+markers') %>%
      
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