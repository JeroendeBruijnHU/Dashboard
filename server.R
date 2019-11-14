#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(httr)
library(highcharter)
library(plotly)
library(shinydashboard)
library(ggplot2)
library(base64enc)
library(rsconnect)

# PIP bestaande compomenten 

# base64enc wordt gebruikt om images te encoden en achter de grafiek te weergeven.
# plotly wordt gebruikt om de grafiek te genereren.
# 


# making post url
url <- 'https://data.castoredc.com/oauth/token'


r <- GET("https://data.castoredc.com/api/country")



print(http_status(r))

print(r)


dates <- c("25/10/19", "26/10/19", "27/10/19", "28/10/19", "29/10/19", "30/10/19", "31/10/19")

#Doelen
score <- c(1,3,5,2,3,1,4) 
score1 <- c(2,1,3,5,4,5,5)
score2 <- c(4,1,2,4,2,1,5)


#Symptomen
score3 <- c(5,2,1,5,2,1,4)
score4 <- c(3,5,4,2,3,4,1)
score5 <- c(1,1,3,2,3,1,4)

#Metingen
stappen <- c(6000,6500,5678,4356,3452,7533,5678)
temperatuur <- c(37,38,39,37,37,37,37)


Datum <- as.Date(dates, format = "%d/%m/%y")
print(Datum)

#score <- c(1,2,3,4,5,1,2,3,4,5,1,2)

data2 <- data.frame(Datum, score)

dataStappen <- data.frame(Datum, stappen)
dataTemp <- data.frame(Datum, temperatuur)


image <- base64enc::base64encode("./slagroeien.jpg")

imageVader <- base64enc::base64encode("./vader.jpg")

imageWerk <- base64enc::base64encode("./werk.jpg")

# trace color based on color
colorBasedValue <- function(score) {
  if (score > 4) {
    result <- "green"
  }
  else if (score < 2) {
    result <- "rellow"
  }
  else {
    result <- "red"
  }
  return(result)
}

# Alle kleuren die gebruikt worden in de lijngrafiek
#colorsValue <- c("rgb(255, 91, 25)", "rgb(255, 161, 26)", "rgb(255, 214, 3)", "rgb(209, 204, 25)", "rgb(104, 190, 120)")

# Kleuren in grafiek voor de demo
colorsValue <- c("rgb(255, 91, 25)", "rgb(255, 214, 3)", "rgb(104, 190, 120)", "rgb(255, 161, 26)", "rgb(255, 214, 3)", "rgb(255, 91, 25)", "rgb(209, 204, 25)")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  
  
  
# Verloop
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
                label = "1J",
                step = "year",
                stepmode = "backward"),
              list(
                count = 2,
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
  
  
  
  

# Doelen    
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
      add_trace(y = score1, name = 'test', mode = 'lines+markers',
                marker = list(
                  color = colorsValue,
                  size = 10,
                  line = list(
                    color = colorsValue,
                    width = 2
                  )
                )) %>%
      
      layout(
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
          fixedrange = TRUE
        ),
        dragmode = "pan"
      ) %>%
    plotly::config(displayModeBar = FALSE)
  })
  
  output$plot3 <- renderPlotly({
    plot_ly(data2, x = Datum) %>%
      add_trace(y = score2, name = 'test', mode = 'lines+markers', 
                marker = list(
                  color = colorsValue,
                  size = 10,
                  line = list(
                    color = colorsValue,
                    width = 2
                  )
                )
                ) %>%
      
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
  
  
  # Symptomen
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
      add_trace(y = score4, name = 'test', mode = 'lines+markers') %>%
      
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
  
  
  
  
  # test
  output$hcontainer <- renderHighchart({
    
    hc <- highcharts_demo() %>%
      hc_rm_series("Berlin") %>% 
      hc_rm_series("Tokyo") %>% 
      hc_chart(type = "line")
    
  })
  
  output$hcontainer2 <- renderHighchart({
    
    hc <- highcharts_demo() %>%
      hc_rm_series("Berlin") %>% 
      hc_rm_series("Tokyo") %>% 
      hc_chart(type = "line")
    
  })
  
  #Meting
  
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
  
  
  
  # test
  output$hcontainer <- renderHighchart({
    
    hc <- highcharts_demo() %>%
      hc_rm_series("Berlin") %>% 
      hc_rm_series("Tokyo") %>% 
      hc_chart(type = "line")
    
  })
  
  output$hcontainer2 <- renderHighchart({
    
    hc <- highcharts_demo() %>%
      hc_rm_series("Berlin") %>% 
      hc_rm_series("Tokyo") %>% 
      hc_chart(type = "line")
    
  })
  
  
  
  
  # test
  output$hcontainer <- renderHighchart({
    
    hc <- highcharts_demo() %>%
      hc_rm_series("Berlin") %>% 
      hc_rm_series("Tokyo") %>% 
      hc_chart(type = "line")
    
  })
  
  output$hcontainer2 <- renderHighchart({
    
    hc <- highcharts_demo() %>%
      hc_rm_series("Berlin") %>% 
      hc_rm_series("Tokyo") %>% 
      hc_chart(type = "line")
    
  })
  
  
  
  
  output$hcontainer5 <- renderHighchart({
    
    hc <- highcharts_demo() %>%
      hc_chart(type = "bar")
    
  })
  
  output$hcontainer6 <- renderHighchart({
    
    hc <- highcharts_demo() %>%
      hc_chart(type = "column")
    
  })
  
})
