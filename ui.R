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
                         plotlyOutput("verloop", height = "400px", width = "80%")),
                  column(10,
                         plotlyOutput("verloop7", height = "400px", width = "100%")),
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
                  ))

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
                       
                       column(2, 
                              tags$div(h4("Doelen")),
                              tags$table( class ="table",
                                tags$tr(tags$th(""), tags$th("Gemiddeld"),tags$th("Laagste")),
                                tags$tr(class= "Sloeproeien", tags$td("Sloeproeien"), tags$td(class = "gemiddelde", tags$span(class="dot")),tags$td(class = "laagste", tags$span(class="dot"))),
                                tags$tr(class= "Vader Zijn", tags$td("Vader Zijn"), tags$td(class = "gemiddelde", tags$span(class="dot")),tags$td(class = "laagste", tags$span(class="dot"))),
                                tags$tr(class= "Werken", tags$td("Werken"), tags$td(class = "gemiddelde", tags$span(class="dot")),tags$td(class = "laagste", tags$span(class="dot")))
                                
                                         
                              )),

                     ),
                     
                     fluidRow(
                     column(2, 
                            tags$div(h4("Symptomen")),
                            tags$table( class ="table borderless",
                                        tags$tr(tags$th(""), tags$th("Gemiddeld"),tags$th("Laagste")),
                                        tags$tr(class= "Hoofdpijn", tags$td("Hoofdpijn"), tags$td(class="gemiddelde", tags$span(class="dot")),tags$td(class ="laagste", tags$span(class="dot"))),
                                        tags$tr(class= "Depressie", tags$td("Depressie"), tags$td(class="gemiddelde",tags$span(class="dot")),tags$td(class ="laagste",tags$span(class="dot"))),
                                        tags$tr(class= "Stress", tags$td("Stress"), tags$td(class="gemiddelde",tags$span(class="dot")),tags$td(class ="laagste",tags$span(class="dot"))),
                                        tags$tr(class= "Angst", tags$td("Angst"), tags$td(class="gemiddelde",tags$span(class="dot")),tags$td(class ="laagste",tags$span(class="dot")))
                            ))
                     
                     ),
                     fluidRow(
                       #verloop 6
                       column(12,
                              plotlyOutput("verloop6", height = "300px", width = "100%"))),
                     fluidRow(
                     column(1, tags$div(class = "bar_chart",                          
                          tags$div(class = "bar_name1", h4("Gamen")),
                          tags$div(class = "bar_name2", h4("Werken")),
                          tags$div(class = "bar_name3", h4("Vader zijn")),
                          tags$div(class = "bar_name3", h4("Sloeproeien"))
                          )),
                     column(5,
                            plotlyOutput("verloop4", height = "400px", width = "100%")),
                     
                       column(1, tags$div(class = "bar_chart",
                                          tags$div(class = "bar_name1", h4("Depressie")),
                                          tags$div(class = "bar_name2", h4("Stress")),
                                          tags$div(class = "bar_name3", h4("Angst")),
                                          tags$div(class = "bar_name3", h4("Hoofdpijn"))
                       )),
                       column(5,
                              plotlyOutput("verloop5", height = "400px", width = "100%"))
                     ),
                     fluidRow(
                       column(1, tags$div(class = "notes",
                                          tags$div(class = "notitie_title", h4("Notities")),
                                          tags$div(class = "foto_title", h4("Foto's")),
                                          tags$div(class = "vragen_title", h4("Vragen"))
                       )), 
                       column(10, offset= 1, tags$div(class = "notities", 
                                                      tags$div(actionButton(class = "btn btn-lg","N1", "?")), 
                                                      tags$div(actionButton(class = "btn btn-lg","N2", "?")), 
                                                      tags$div(actionButton(class = "btn btn-lg","N3", "?")), 
                                                      tags$div(), 
                                                      tags$div(actionButton(class = "btn btn-lg","N5", "?")), 
                                                      tags$div(actionButton(class = "btn btn-lg","N6", "?")), 
                                                      tags$div(actionButton(class = "btn btn-lg","N7", "?")))),
                       column(10, offset= 1, tags$div(class = "fotos", 
                                                      tags$div(actionButton(class = "btn btn-lg btn-info","F1", "?")), 
                                                      tags$div(actionButton(class = "btn btn-lg btn-info","F2", "?")), 
                                                      tags$div(actionButton(class = "btn btn-lg btn-info","F3", "?")), 
                                                      tags$div(actionButton(class = "btn btn-lg btn-info","F4", "?")), 
                                                      tags$div(), 
                                                      tags$div(), 
                                                      tags$div(actionButton(class = "btn btn-lg btn-info","F7", "?")))),
                       column(10, offset= 1, tags$div(class = "vragen", 
                                                      tags$div(actionButton(class = "btn btn-lg","V1", "?")), 
                                                      tags$div(), 
                                                      tags$div(actionButton(class = "btn btn-lg","V3", "?")), 
                                                      tags$div(actionButton(class = "btn btn-lg","V4", "?")), 
                                                      tags$div(), 
                                                      tags$div(actionButton(class = "btn btn-lg","V6", "?")), 
                                                      tags$div()))
                     ),
                     fluidRow(
                       
                     ))

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