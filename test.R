test <- function(input, output){
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
}