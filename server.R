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

# making post url
url <- 'https://data.castoredc.com/oauth/token'


r <- GET("https://data.castoredc.com/api/country")



print(http_status(r))

print(r)

month <- c('January', 'February', 'March', 'April', 'May', 'June', 'July',
           'August', 'September', 'October', 'November', 'December')
#month <- c(1,2,3,4,5,1,2,3,4,5,1,2)


dates <- c("25/10/19", "26/10/19", "27/10/19", "28/10/19", "29/10/19", "30/10/19", "31/10/19")
score <- c(1, 2, 3, 4, 5, 4, 3) 

betterDates <- as.Date(dates, format = "%d/%m/%y")
print(betterDates)

#score <- c(1,2,3,4,5,1,2,3,4,5,1,2)

data2 <- data.frame(betterDates, score)


image <- base64enc::base64encode("slagroeien.jpg")

imageVader <- base64enc::base64encode("Vader.jpg")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$plot <- renderPlotly({
    plot_ly(data2, x = ~betterDates) %>%
      add_trace(y = ~score, name = 'test', mode = 'lines+markers') %>%
      
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
            source = paste("data:image/jpg;base64,", image),
            opacity = 0.2, 
            xanchor = "center", 
            yanchor = "middle"
          )
        ), 
        yaxis = list(
          dtick = 1, 
          tick0 = 1, 
          tickmode = "linear"
        )
      )
    })
  
  
  output$plot2 <- renderPlotly({
    plot_ly(data2, x = ~betterDates) %>%
      add_trace(y = ~score, name = 'test', mode = 'lines+markers') %>%
      
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
            source = paste("data:image/jpg;base64,", imageVader),
            opacity = 0.2, 
            xanchor = "center", 
            yanchor = "middle"
          )
        ), 
        yaxis = list(
          dtick = 1, 
          tick0 = 1, 
          tickmode = "linear"
        )
      )
  })
  
  output$patient <- renderValueBox({
    valueBox(
      formatC('Patient nr #123241 59 jaar | 29-04-1960', format="d", big.mark=',')
      ,paste('')
      ,icon = icon("",lib='font-awesome')
      ,color = "green")
  })
  
  output$gebruik <- renderValueBox({
    valueBox(
      formatC('83% bijgehouden over 14 weken Laatste update 14 oktober 2019', format="d", big.mark=',')
      ,paste('')
      ,icon = icon("",lib='font-awesome'))
  })
  
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
  
  output$hcontainer3 <- renderHighchart({
    
    hc <- highcharts_demo() %>%
      hc_chart(type = "line")
    
  })
  
  output$hcontainer4 <- renderHighchart({
    
    hc <- highcharts_demo() %>%
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
