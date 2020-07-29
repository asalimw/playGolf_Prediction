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

                  navbarPage(title = "Play Golf?",
                      tabPanel("Main", 
                               HTML("<h3>Input parameters</h3>"),
                               
                               selectInput("outlook", label = "Outlook:", 
                                           choices = list("Sunny" = "sunny", "Overcast" = "overcast", "Rainy" = "rainy"), 
                                           selected = "Rainy"),
                               sliderInput("temperature", "Temperature (F):",
                                           min = 64, max = 86,
                                           value = 70),
                               sliderInput("humidity", "Humidity (%):",
                                           min = 65, max = 96,
                                           value = 90),
                               selectInput("windy", label = "Windy:", 
                                           choices = list("Yes" = "TRUE", "No" = "FALSE"), 
                                           selected = "TRUE"),
                               
                               actionButton("submitbutton", "Submit", class = "btn btn-primary"),
                               
                               tags$br(),
                               tags$hr(),
                               
                               tags$label(h3('Should I play?')), # Status/Output Text Box
                               verbatimTextOutput('contents'),
                               tableOutput('tabledata') # Prediction results table
                               ),
                      
                      tabPanel("How to use",
                               tags$label(h4("Unfavourable weather conditions will affect your golf day!")),
                               tags$br(),
                               tags$body(h5("To determine whether it is a good day for you to play golf, you will need to select \
                                            the following weather condition in the main page")),
                               tags$br(),
                               tags$ol(
                                   tags$li("Outlook - Sunny, Overcast or Rainy"), 
                                   tags$li("Temperature in Fahrenheit"), 
                                   tags$li("Humidity"),
                                   tags$li("Windy - Yes or No"),
                                      )
                            ),
                      tabPanel("How it works",
                               tags$label(h3("Prediction Methodology")),
                               tags$br(),
                               tags$div(
                                   tags$p("There absolutely is such a thing as golf weather, 
                                          although that specific spectrum of perfectly playable weather conditions depends on where you live, 
                                          how creaky your body gets, what time of the year it is, 
                                          and how dedicated you are to the sport. 
                                          A vast majority of dedicated golfers love cooler weather with low humidity and no breeze 
                                          (or just a little bit of a breeze)."), 
                                   
                                   tags$p("The method used to predict the ideal golf day is to use Random Forest. 
                                          Random forests or random decision forests are an ensemble learning method for classification, 
                                          regression and other tasks that operate by constructing a multitude of decision trees at training time 
                                          and outputting the class that is the mode of the classes (classification) or mean prediction (regression) 
                                          of the individual trees."), 
                                   tags$p("The weather dataset used contains 14 examples of weather condition
                                          suitable for playing a game of golf. The info on this data set can be found here:"),
                                   tags$a(href="https://datacadamia.com/data_mining/weather", "Click here for dataset info!")
                              ),
                              tags$br(),
                              
                              tags$div(
                                  tags$p("Once the dataset is downloaded we will fit the model and perform prediction on the test dataset. 
                                         Please check out my code by clicking on this link"), 
                              ),
                              tags$a(href="https://github.com/asalimw/playGolf_Prediction/tree/master/playGolfPrediction", "Click here to check out my code!"),
                              tags$br(),
                              tags$br(),
                              HTML("<h2><center>Thank You!</center></h2>")
                        )
                               
                      
                                
                  )
    )
)