library(shiny)
library(httr)
library(highcharter)
library(plotly)
library(shinydashboard)
library(ggplot2)
library(base64enc)
library(rsconnect)

voorpagina <- function(input, output){
  
  # verloop 4
  output$verloop4 <- renderPlotly({
    plot_ly(data2, x = Datum,
            marker = list(color = 'white',
                          line = list(color = 'white',
                                      width = 5))) %>% 
      add_bars(name = "Sloeproeien", y = c(0.2, 0.6, 1, 0.4, 0.6, 0.2, 0.8),
                base = 1,
                marker = list(
                  color = colorsValue
                )
      ) %>%
      
      add_bars(name = "Vader zijn", x = Datum, y = c(0.8,0.2,0.4,0.8,0.4,0.2,1),
                base = 2,
                marker = list(
                  color = colorsValue2
                )
                
      ) %>%
      
      add_bars(name = "Werken", x= Datum, y = c(1,0.4,0.2,1,0.4,0.2,0.6),
                base = 3,
                marker = list(
                  color = colorsValue3
                )
                
      ) %>%
      
      add_bars(name = "Gamen", x= Datum, y = c(0.2, 0.6, 1, 0.4, 0.6, 0.2, 0.8),
               base = 4,
               marker = list(
                 color = colorsValue
               )
               
      ) %>%
      
      layout(
        title = list (
          text = "Doelen",
          y = 0.85,
          x = 0.55,
          xanchor = 'center',
          yanchor = 'top'
        ),
        showlegend=FALSE,
        barmode='stack',
        font= list(
          family="American Typewriter",
          size=15,
          color="#7D7771"
        ),
        yaxis = list(
          dtick = 1, 
          tick0 = 1,
          showticklabels = FALSE,
          tickmode = "linear",
          fixedrange = TRUE,
          range = c(1,6)
        ),
        xaxis = list(
          rangeselector = list(
            buttons = list(
              list(
                count = 7,
                label = "1W",
                width = "50",
                height = "50",
                step = "day",
                stepmode = "backward"),
              list(
                count = 1,
                label = "1M",
                width = "50",
                height = "50",
                step = "month",
                stepmode = "backward"),
              list(
                count = 3,
                label = "3M",
                width = "50",
                height = "50",
                step = "month",
                stepmode = "backward"),
              list(
                count = 6,
                width = "50",
                height = "50",
                label = "6M",
                step = "month",
                stepmode = "backward"),
              list(
                count = 1,
                width = "50",
                height = "50",
                label = "1J",
                step = "year",
                stepmode = "backward"),
              list(
                count = 2,
                width = "50",
                height = "50",
                label = "2J",
                step = "year",
                stepmode = "todate"))),
          
          #rangeslider = list(type = "date")
          FALSE
        ),
        dragmode = "pan"
      ) %>%
      
      plotly::config(displayModeBar = FALSE)
  })
  
  # verloop 5
  output$verloop5 <- renderPlotly({
    plot_ly(data2, x = Datum,
            marker = list(color = 'white',
                          line = list(color = 'white',
                                      width = 5))) %>% 
      add_bars(name = "Hoofdpijn", y = c(0.2, 0.6, 1, 0.4, 0.6, 0.2, 0.8),
               base = 1,
               marker = list(
                 color = colorsValue
               )
      ) %>%
      
      add_bars(name = "Angst", x = Datum, y = c(0.8,0.2,0.4,0.8,0.4,0.2,1),
               base = 2,
               marker = list(
                 color = colorsValue2
               )
               
      ) %>%
      
      add_bars(name = "Stress", x= Datum, y = c(1,0.4,0.2,1,0.4,0.2,0.6),
               base = 3,
               marker = list(
                 color = colorsValue3
               )
               
      ) %>%
      
      add_bars(name = "Depressie", x= Datum, y = c(0.2, 0.6, 1, 0.4, 0.6, 0.2, 0.8),
               base = 4,
               marker = list(
                 color = colorsValue
               )
               
      ) %>%
      
      layout(
        title = list (
          text = "Symptomen",
          y = 0.85,
          x = 0.55,
          xanchor = 'center',
          yanchor = 'top'
        ),
        showlegend=FALSE,
        barmode='stack',
        font= list(
          family="American Typewriter",
          size=15,
          color="#7D7771"
        ),
        yaxis = list(
          dtick = 1, 
          tick0 = 1,
          showticklabels = FALSE,
          tickmode = "linear",
          fixedrange = TRUE,
          range = c(1, 6)
        ),
        xaxis = list(
          rangeselector = list(
            buttons = list(
              list(
                count = 7,
                label = "1W",
                width = "50",
                height = "50",
                step = "day",
                stepmode = "backward"),
              list(
                count = 1,
                label = "1M",
                width = "50",
                height = "50",
                step = "month",
                stepmode = "backward"),
              list(
                count = 3,
                label = "3M",
                width = "50",
                height = "50",
                step = "month",
                stepmode = "backward"),
              list(
                count = 6,
                width = "50",
                height = "50",
                label = "6M",
                step = "month",
                stepmode = "backward"),
              list(
                count = 1,
                width = "50",
                height = "50",
                label = "1J",
                step = "year",
                stepmode = "backward"),
              list(
                count = 2,
                width = "50",
                height = "50",
                label = "2J",
                step = "year",
                stepmode = "todate"))),
          
          #rangeslider = list(type = "date")
          FALSE
        ),
        dragmode = "pan"
      ) %>%
      
      plotly::config(displayModeBar = FALSE)
  })
  
  # verloop 6
  output$verloop6 <- renderPlotly({
    plot_ly(data2, x = Datum) %>% 
      add_trace(name = "Sloeproeien", y = score, mode = 'lines+markers',  
                marker = list(
                  color = colorsValue,
                  size = 10,
                  line = list(
                    color = colorsValue,
                    width = 2
                  )
                )
      ) %>%
      
      add_trace(name = "Vader zijn", y = score2, mode = 'line+markers',
                line = list(color = 'rgb(205, 12, 24)', dash = 'dash'),
                marker = list(
                  #symbol = 'triangle-up',
                  color = colorsValue2,
                  size = 10,
                  line = list(
                    color = colorsValue2,
                    width = 2
                  )
                )
                
      ) %>%
      
      add_trace(name = "Werken", y = score3, mode = 'lines+markers',
                line = list(dash = 'dot'),
                marker = list(
                  #symbol = 'x',
                  color = colorsValue3,
                  size = 10,
                  line = list(
                    color = colorsValue3,
                    width = 2,
                    dash = 'dot'
                  )
                )
                
      ) %>%
      
      layout(
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
            source = paste("data:image/jpg;base64,", logo),
            opacity = 0.2, 
            xanchor = "center",
            yanchor = "middle"
          ),
          list(
            x = 0.5, 
            y = 0.5, 
            xref = "paper", 
            yref = "paper", 
            layer = "below", 
            sizex = 0.9999999999999999, 
            sizey = 0.9999999999999997, 
            sizing = "fill", 
            source = paste("data:image/png;base64,", imageArrow),
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
                label = "1W",
                width = "50",
                height = "50",
                step = "day",
                stepmode = "backward"),
              list(
                count = 1,
                label = "1M",
                width = "50",
                height = "50",
                step = "month",
                stepmode = "backward"),
              list(
                count = 3,
                label = "3M",
                width = "50",
                height = "50",
                step = "month",
                stepmode = "backward"),
              list(
                count = 6,
                width = "50",
                height = "50",
                label = "6M",
                step = "month",
                stepmode = "backward"),
              list(
                count = 1,
                width = "50",
                height = "50",
                label = "1J",
                step = "year",
                stepmode = "backward"),
              list(
                count = 2,
                width = "50",
                height = "50",
                label = "2J",
                step = "year",
                stepmode = "todate"))),
          
          #rangeslider = list(type = "date")
          FALSE
        ),
        dragmode = "pan"
      ) %>%
      
      plotly::config(displayModeBar = FALSE)
  })
}