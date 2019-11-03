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


patientEnGebruik <- fluidRow(column(4, h3("Patient nr #123241 " , tags$br(), " 59 jaar | 29-04-1960")), column(4, h3("83% bijgehouden over 14 weken " , tags$br(), " Laatste update 14 oktober 2019")), theme = "custom.css")



test <- fluidRow(box(title ="fietsen", highchartOutput("hcontainer",height = "500px")), box(title = "Vader zijn", highchartOutput("hcontainer2",height = "500px")), box(title ="fietsen", highchartOutput("hcontainer5",height = "500px")), box(title ="fietsen", highchartOutput("hcontainer6",height = "500px")))

symptomen <- fluidRow(
                  box(title = "Depressie",
                      fluidRow(actionButton("goButton", "W", width = '14%', style = "float: right;"), actionButton("goButton", "M", width = '14%', style = "float: right;"),actionButton("goButton", "3M", width = '14%', style = "float: right;"),actionButton("goButton", "3M", width = '14%', style = "float: right;") ,actionButton("goButton", "6M",width = '14%', style = "float: right;"),actionButton("goButton", "Y",width = '14%', style = "float: right;"), actionButton("goButton", "2Y", width = '14%', style = "float: right;")),
                      plotlyOutput("symptoom1", height = "500px")), 
                  
                  box(title = "Stress",
                      fluidRow(actionButton("goButton", "W", width = '14%', style = "float: right;"), actionButton("goButton", "M", width = '14%', style = "float: right;"),actionButton("goButton", "3M", width = '14%', style = "float: right;"),actionButton("goButton", "3M", width = '14%', style = "float: right;") ,actionButton("goButton", "6M",width = '14%', style = "float: right;"),actionButton("goButton", "Y",width = '14%', style = "float: right;"), actionButton("goButton", "2Y", width = '14%', style = "float: right;")),
                      plotlyOutput("symptoom2", height = "500px")), 
                  
                  box(title = "Angst",
                      fluidRow(actionButton("goButton", "W", width = '14%', style = "float: right;"), actionButton("goButton", "M", width = '14%', style = "float: right;"),actionButton("goButton", "3M", width = '14%', style = "float: right;"),actionButton("goButton", "3M", width = '14%', style = "float: right;") ,actionButton("goButton", "6M",width = '14%', style = "float: right;"),actionButton("goButton", "Y",width = '14%', style = "float: right;"), actionButton("goButton", "2Y", width = '14%', style = "float: right;")),
                      plotlyOutput("symptoom3", height = "500px")))

metingen <- fluidRow(
              box(title ="Stappen", 
                  plotlyOutput("meting", height = "500px")), 
              box(title = "Temperatuur", 
                  plotlyOutput("meting2", height = "500px")))

vragen <- fluidRow(
            column(12, h3("Wat is de waarschijnlijkheid dat kanker terugkomt?")),
            column(12, h3("Wat verandert er voor mijn familie door de kanker")),
            column(12, h3("is het normaal dat ik uitlsag op mijn schouder heb?")),
          )

notities <- fluidRow()

doelen <- fluidRow(
                  box(title = "Slagroeien",
                      fluidRow(actionButton("goButton", "W", width = '14%', style = "float: right;"), actionButton("goButton", "M", width = '14%', style = "float: right;"),actionButton("goButton", "3M", width = '14%', style = "float: right;"),actionButton("goButton", "3M", width = '14%', style = "float: right;") ,actionButton("goButton", "6M",width = '14%', style = "float: right;"),actionButton("goButton", "Y",width = '14%', style = "float: right;"), actionButton("goButton", "2Y", width = '14%', style = "float: right;")),
                       plotlyOutput("plot", height = "500px")), 
                   
                   box(title = "Vader zijn", 
                       fluidRow(actionButton("goButton", "W", width = '14%', style = "float: right;"), actionButton("goButton", "M", width = '14%', style = "float: right;"),actionButton("goButton", "3M", width = '14%', style = "float: right;"),actionButton("goButton", "3M", width = '14%', style = "float: right;") ,actionButton("goButton", "6M",width = '14%', style = "float: right;"),actionButton("goButton", "Y",width = '14%', style = "float: right;"), actionButton("goButton", "2Y", width = '14%', style = "float: right;")),
                       plotlyOutput("plot2", height = "500px")), 
                   box(title = "Werken",
                       fluidRow(actionButton("goButton", "W", width = '14%', style = "float: right;"), actionButton("goButton", "M", width = '14%', style = "float: right;"),actionButton("goButton", "3M", width = '14%', style = "float: right;"),actionButton("goButton", "3M", width = '14%', style = "float: right;") ,actionButton("goButton", "6M",width = '14%', style = "float: right;"),actionButton("goButton", "Y",width = '14%', style = "float: right;"), actionButton("goButton", "2Y", width = '14%', style = "float: right;")),
                       plotlyOutput("plot3", height = "500px")))

#body <- dashboardBody(patient, doelen, symptomen, metingen, vragen)

#dashboardPage(header, dashboardSidebar(disable = TRUE), body)


fluidPage(
  
  patientEnGebruik,
  
  navbarPage("Goings-On",
             tabPanel("Doelen",  doelen),
             tabPanel("Symptomen", symptomen),
             tabPanel("Metingen", metingen), 
             tabPanel("Vragen en zorg", vragen), 
             tabPanel("Notities en Fotos", notities), 
             tabPanel("Test", test)
  )
)

