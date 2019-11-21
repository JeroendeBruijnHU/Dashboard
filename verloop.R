library(shiny)
library(httr)
library(highcharter)
library(plotly)
library(shinydashboard)
library(ggplot2)
library(base64enc)
library(rsconnect)

voorpagina <- function(input, output){
  output$verloop <- renderPlotly({
    plot_ly(data2, x = Datum) %>% 
      add_trace(name = "Sloeproeien", y = score, mode = 'lines+markers',  
                marker = list(
                  color = colorsValue,
                  size = 15,
                  line = list(
                    color = colorsValue,
                    width = 2
                  )
                )
      ) %>%
      
      add_trace(name = "Vader zijn", y = score2, mode = 'lines+markers',
                line = list(color = 'rgb(205, 12, 24)'),
                marker = list(
                  color = colorsValue2,
                  size = 15,
                  line = list(
                    color = colorsValue2,
                    width = 2
                  )
                )
                
      ) %>%
      
      add_trace(name = "Werken", y = score3, mode = 'lines+markers',
                marker = list(
                  color = colorsValue3,
                  size = 15,
                  line = list(
                    color = colorsValue3,
                    width = 2
                  )
                )
                
      ) %>%
      
      layout(
        updatemenus = list(
          chart_types <- list(
            direction = "left",
            xanchor = 'left',
            yanchor = "left",
            pad = list('r'= 0, 't'= 5, 'b' = 10),
            x = 0,
            y = 1.3,
            type = "buttons",
            y = 0.8,
            buttons = list(
              
              list(method = "restyle",
                   args = list(),
                   width = 1,
                   height = 1,
                   label = "1W"),
              
              list(method = "restyle",
                   args = list(),
                   label = "1M"),
              
              list(method = "restyle",
                   args = list(),
                   label = "3M"),
              
              list(method = "restyle",
                   args = list(),
                   label = "6M"),
              list(method = "restyle",
                   args = list(),
                   label = "1J"),
              list(method = "restyle",
                   args = list(),
                   label = "2J")
              
            )
          ),
          DoelenButtons <- list(
            type = "buttons",
            xanchor = 'center',
            yanchor = "top",
            x = 1.07,
            y = 0.7,
            buttons = list(
              list(method = "restyle",
                   args = list(),
                   label = "Sloeproeien"),
              list(method = "restyle",
                   args = list(),
                   label = "Vader zijn"),
              list(method = "restyle",
                   args = list(),
                   label = "Werken")
            )
          )
          
        ),
        
        
        annotations= list(
          yref='paper',xref="paper",y=1.05,x=1.1, text="Doelen",showarrow=F,
          yref='paper',xref="paper",y=1.05,x=1.1, text="Symptomen"
          
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
            source = paste("data:image/png;base64,", imagePijlen),
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