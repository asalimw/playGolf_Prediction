#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("united"),

                  # Page header
                  headerPanel('Play Golf?'),
                  
                  # Input values
                  sidebarPanel(
                      HTML("<h3>Input parameters</h3>"),
                      
                      selectInput("outlook", label = "Outlook:", 
                                  choices = list("Sunny" = "sunny", "Overcast" = "overcast", "Rainy" = "rainy"), 
                                  selected = "Rainy"),
                      sliderInput("temperature", "Temperature:",
                                  min = 64, max = 86,
                                  value = 70),
                      sliderInput("humidity", "Humidity:",
                                  min = 65, max = 96,
                                  value = 90),
                      selectInput("windy", label = "Windy:", 
                                  choices = list("Yes" = "TRUE", "No" = "FALSE"), 
                                  selected = "TRUE"),
                      
                      actionButton("submitbutton", "Submit", class = "btn btn-primary")
                  ),
                  
                  mainPanel(
                      tags$label(h3('Status/Output')), # Status/Output Text Box
                      verbatimTextOutput('contents'),
                      tableOutput('tabledata') # Prediction results table
                      
                  )
    )
)