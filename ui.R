#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(highcharter)
library(plotly)

header <- dashboardHeader(title = "Goings-On")


patientEnGebruik <- fluidRow(column(4, h3("Patient nr #123241 " , tags$br(), " 59 jaar | 29-04-1960"), style = "background-color:#b3cebd;border: 3px solid white;"), column(4, h3("83% bijgehouden over 14 weken " , tags$br(), " Laatste update 14 oktober 2019"),  style = "background-color:#b3cebd;", style='border: 3px solid white'))


test <- fluidRow(
                  box(title ="fietsen", highchartOutput("hcontainer",height = "500px")), 
                  box(title = "Vader zijn", highchartOutput("hcontainer2",height = "500px")), 
                  box(title ="fietsen", highchartOutput("hcontainer5",height = "500px")), 
                  box(title ="fietsen", highchartOutput("hcontainer6",height = "500px")),
                  column(10,
                         plotlyOutput("verloop2", height = "400px", width = "100%")),
                  column(1,
                         checkboxGroupInput("variable", "Doelen",
                                            selected = c("Sloeproeien" = "cyl",
                                                         "Vader zijn" = "am",
                                                         "Werken" = "gear"), 
                                            c("Sloeproeien" = "cyl",
                                              "Vader zijn" = "am",
                                              "Werken" = "gear"))
                  ),
                  column(1,
                         checkboxGroupInput("variable", "Symptomen",
                                            c("Depressie" = "cyl",
                                              "Stress" = "am",
                                              "Angst" = "gear"))
                  ),
                  column(12,
                         plotlyOutput("verloop", height = "400px", width = "80%"))
                  
                  )

symptomen <- fluidRow(
                  box(h2("Depressie"),
                      fluidRow(actionButton("goButton", "2Y", width = '16%', style = "float: right;"), actionButton("goButton", "Y", width = '16%', style = "float: right;"),actionButton("goButton", "6M", width = '16%', style = "float: right;") ,actionButton("goButton", "3M",width = '16%', style = "float: right;"),actionButton("goButton", "M",width = '16%', style = "float: right;"), actionButton("goButton", "W", width = '16%', style = "float: right;")),
                      plotlyOutput("symptoom1", height = "500px")), 
                  
                  box(h2("Stress"),
                      fluidRow(actionButton("goButton", "2Y", width = '16%', style = "float: right;"), actionButton("goButton", "Y", width = '16%', style = "float: right;"),actionButton("goButton", "6M", width = '16%', style = "float: right;") ,actionButton("goButton", "3M",width = '16%', style = "float: right;"),actionButton("goButton", "M",width = '16%', style = "float: right;"), actionButton("goButton", "W", width = '16%', style = "float: right;")),
                      plotlyOutput("symptoom2", height = "500px")), 
                  
                  box(h2("Angst"),
                      fluidRow(actionButton("goButton", "2Y", width = '16%', style = "float: right;"), actionButton("goButton", "Y", width = '16%', style = "float: right;"),actionButton("goButton", "6M", width = '16%', style = "float: right;") ,actionButton("goButton", "3M",width = '16%', style = "float: right;"),actionButton("goButton", "M",width = '16%', style = "float: right;"), actionButton("goButton", "W", width = '16%', style = "float: right;")),
                      plotlyOutput("symptoom3", height = "500px")))

metingen <- fluidRow(
              box(title ="Stappen", 
                  plotlyOutput("meting", height = "500px")), 
              box(title = "Temperatuur", 
                  plotlyOutput("meting2", height = "500px")))

vragen <- fluidRow(
            column(12, h4("Wat is de waarschijnlijkheid dat kanker terugkomt?")),
            column(12, h4("Wat verandert er voor mijn familie door de kanker")),
            column(12, h4("is het normaal dat ik uitlsag op mijn schouder heb?")),
          )

notities <- fluidRow()

doelen <- fluidRow(
                  box(
                      #fluidRow(actionButton("goButton", "2J", width = '16%', style = "float: right;"), actionButton("goButton", "1J", width = '16%', style = "float: right;"),actionButton("goButton", "6M", width = '16%', style = "float: right;") ,actionButton("goButton", "3M",width = '16%', style = "float: right;"),actionButton("goButton", "1M",width = '16%', style = "float: right;"), actionButton("goButton", "1W", width = '16%', style = "float: right;")),
                       plotlyOutput("plot", height = "400px")), 
                   
                   box(
                       #fluidRow(actionButton("goButton", "2J", width = '16%', style = "float: right;"), actionButton("goButton", "1J", width = '16%', style = "float: right;"),actionButton("goButton", "6M", width = '16%', style = "float: right;") ,actionButton("goButton", "3M",width = '16%', style = "float: right;"),actionButton("goButton", "1M",width = '16%', style = "float: right;"), actionButton("goButton", "1W", width = '16%', style = "float: right;")),
                       plotlyOutput("plot2", height = "400px")), 
                   box(
                       #fluidRow(actionButton("goButton", "2J", width = '16%', style = "float: right;"), actionButton("goButton", "1J", width = '16%', style = "float: right;"),actionButton("goButton", "6M", width = '16%', style = "float: right;") ,actionButton("goButton", "3M",width = '16%', style = "float: right;"),actionButton("goButton", "1M",width = '16%', style = "float: right;"), actionButton("goButton", "1W", width = '16%', style = "float: right;")),
                       plotlyOutput("plot3", height = "400px")))


verloop <- fluidRow(
                     fluidRow(
                     #verloop 3
                     column(10,
                            plotlyOutput("verloop3", height = "300px", width = "100%")),
                     column(1,
                            checkboxGroupInput("variable", "Doelen",
                                               selected = c("Sloeproeien" = "cyl",
                                                            "Vader zijn" = "am",
                                                            "Werken" = "gear"), 
                                               c("Sloeproeien" = "cyl",
                                                 "Vader zijn" = "am",
                                                 "Werken" = "gear"))
                     ),
                     column(1,
                            checkboxGroupInput("variable", "Symptomen",
                                               c("Depressie" = "cyl",
                                                 "Stress" = "am",
                                                 "Angst" = "gear"))
                     )),
                     fluidRow(
                     column(2, tags$div(class = "bar_chart",
                          h4("Gamen"),
                          h4("Werken"),
                          h4("Vader zijn"),
                          h4("Sloeproeien")
                          )),
                     column(10,
                            plotlyOutput("verloop4", height = "400px", width = "100%"))
                     )
                       )

#body <- dashboardBody(patient, doelen, symptomen, metingen, vragen)

#dashboardPage(header, dashboardSidebar(disable = TRUE), body)


fluidPage(
  tags$script(src = "custom.js"),
  theme = "./custom.css",
  patientEnGebruik,
  
    navbarPage('Goings-On', collapsible=TRUE,
               tabPanel("Verloop", verloop),
               tabPanel("Doelen",  doelen),
               tabPanel("Symptomen", symptomen),
               tabPanel("Metingen", metingen), 
               tabPanel("Vragen en zorgen", vragen), 
               tabPanel("Notities en Fotos", notities), 
               tabPanel("Test", test)
    )
)

