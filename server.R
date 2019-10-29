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

r <- GET("https://data.castoredc.com/api/country")

print(http_status(r))

print(r)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
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
      hc_chart(type = "line")
    
  })
  
  output$hcontainer2 <- renderHighchart({
    
    hc <- highcharts_demo() %>%
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
