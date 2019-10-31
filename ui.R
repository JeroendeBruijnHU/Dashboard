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


header <- dashboardHeader(title = "Goings-On")

patientEnGebruik <- fluidRow(

  valueBoxOutput("patient"),
  valueBoxOutput("gebruik")
)


doelen <- fluidRow(box(title ="fietsen", highchartOutput("hcontainer",height = "500px")), box(title = "Vader zijn", highchartOutput("hcontainer2",height = "500px")))

symptomen <- fluidRow(box(title ="Hoofdpijn", highchartOutput("hcontainer3",height = "500px")), box(title = "Koorts", highchartOutput("hcontainer4",height = "500px")))

metingen <- fluidRow(box(title ="Stappen", highchartOutput("hcontainer5",height = "500px")), box(title = "Temperatuur", highchartOutput("hcontainer6",height = "500px"))) 

vragen <- fluidRow(h2("vragen"))

#body <- dashboardBody(patient, doelen, symptomen, metingen, vragen)

#dashboardPage(header, dashboardSidebar(disable = TRUE), body)


fluidPage(
  
  patientEnGebruik,
  
  navbarPage("Goings-On",
             tabPanel("Doelen",  doelen),
             tabPanel("Symptomen", symptomen),
             tabPanel("Metingen", metingen), 
             tabPanel("Vragen", vragen)
  )
)

