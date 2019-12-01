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

source('verloop.R', local = TRUE)
source('doelen.R', local = TRUE)
source('symptomen.R', local = TRUE)
source('metingen.R', local = TRUE)
source('test.R', local = TRUE)



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


#verloop bar
bar_doelen <- c('Sloeproeien', 'Vader zijn', 'Werken', 'Sloeproeien', 'Vader zijn', 'Werken', 'Sloeproeiren')
bar_symptomen <- c('Depressie', 'Stress', 'Angst')


Datum <- as.Date(dates, format = "%d/%m/%y")
print(Datum)

#score <- c(1,2,3,4,5,1,2,3,4,5,1,2)

data2 <- data.frame(Datum, score)

dataStappen <- data.frame(Datum, stappen)
dataTemp <- data.frame(Datum, temperatuur)


image <- base64enc::base64encode("./images/slagroeien.jpg")

imageVader <- base64enc::base64encode("./images/vader.jpg")

imageWerk <- base64enc::base64encode("./images/werk.jpg")

imagePijlen <-base64enc::base64encode("./images/arrows.png")

regenboog <-base64enc::base64encode("./images/regenboog2.jpg")

logo <-base64enc::base64encode("./images/logo.jpg")

# Alle kleuren die gebruikt worden in de lijngrafiek
#colorsValue <- c("rgb(255, 91, 25)", "rgb(255, 161, 26)", "rgb(255, 214, 3)", "rgb(209, 204, 25)", "rgb(104, 190, 120)")

# Kleuren in grafiek voor de demo
colorsValue <- c("rgb(255, 91, 25)", "rgb(255, 214, 3)", "rgb(104, 190, 120)", "rgb(255, 161, 26)", "rgb(255, 214, 3)", "rgb(255, 91, 25)", "rgb(209, 204, 25)")
colorsValue2 <-c("rgb(209, 204, 25)", "rgb(255, 91, 25)", "rgb(255, 161, 26)",  "rgb(209, 204, 25)","rgb(255, 161, 26)", "rgb(255, 91, 25)", "rgb(104, 190, 120)")
colorsValue3 <- c("rgb(104, 190, 120)", "rgb(255, 161, 26)", "rgb(255, 91, 25)", "rgb(104, 190, 120)", "rgb(255, 161, 26)","rgb(255, 91, 25)", "rgb(209, 204, 25)")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
# Verloop
voorpagina(input, output)

# Doelen
doelen(input, output)

# Symptomen
symptomen(input, output)

# Metingen
metingen(input, output)
  
# test
test(input, output)  
})
