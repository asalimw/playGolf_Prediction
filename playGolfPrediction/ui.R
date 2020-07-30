#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# Created by Willianto Asalim on 28 July 2020
# With the help of DataProfessor.

library(shiny)
library(shinythemes)

# Define UI for predicting whether to play golf
shinyUI(fluidPage(theme = shinytheme("cerulean"),
                    
                  # 3 tab panels with Title
                  navbarPage(title = "Golf Day?",
                      
                      # Tab panel 1
                      tabPanel("Main", 
                               h4(
                                 "Today is ",
                                 
                                 textOutput("currentTime", container = span),
                               ),
                               br(),
                               
                               HTML("<h2>Bad weather will ruin your golf day!</h3>"),
                               HTML("<h5>Created by Willianto Asalim</h5>"),
                               
                               hr(),
                               
                               
                               HTML("<h3>Weather Conditions Input:</h3>"),
                               
                               br(),
                               
                               selectInput("outlook", label = "Outlook:", 
                                           choices = list("Sunny" = "sunny", "Overcast" = "overcast", "Rainy" = "rainy"), 
                                           selected = "Rainy"),
                               
                               sliderInput(inputId = "temperature", label = "Temperature (F):",
                                           min = 64, max = 86,
                                           value = 70),
                               
                               sliderInput("humidity", "Humidity (%):",
                                           min = 65, max = 96,
                                           value = 90),
                               selectInput("windy", label = "Windy:", 
                                           choices = list("Yes" = "TRUE", "No" = "FALSE"), 
                                           selected = "TRUE"),
                               
                               actionButton("submitbutton", "Submit", class = "btn btn-primary"),
                               
                               br(),
                               hr(),
                               

                               tags$label(h3('Should I play?')), # Status/Output Text Box
                               verbatimTextOutput('contents'),
                               tableOutput('tabledata') # Prediction results table
                               ),
                      
                      #Tab Panel 2
                      tabPanel("How to use",
                               p(h3("Unfavourable weather conditions will affect your golf day!")),
                               
                               br(),
                               
                               p(h5("To determine whether it is a good day for you to play golf, you will need to select
                                            the following weather condition in the main page")),
                               
                               br(),
                               
                               tags$ol(
                                   tags$li("Outlook - Sunny, Overcast or Rainy"), 
                                   tags$li("Temperature in Fahrenheit"), 
                                   tags$li("Humidity"),
                                   tags$li("Windy - Yes or No"),
                                    ),
                               
                               br(),
                               p("Click the", span("Submit button", style = "color:blue"),
                                 "in the main page once all the weather conditions have been selected."),
                               
                               br(),
                               br(),
                               
                               p(h3("Handy tips:")),
                               
                               hr(),
                               
                               p("Winds - If it’s windy, especially with strong gusts, 
                                 timing will be a major factor along with the ability to adjust the shot. 
                                 Gusts are the sudden short-lived winds, noticeably stronger than the mean/ongoing wind. 
                                 Over water and long grass, you can see them approaching, with darkening on the surface."),
                               
                               p("Rain - Some people don't like to play if it is raining, 
                                 but it is easy enough to get caught in a shower on an otherwise fine day.
                                 The rain will affect conditions underfoot, your grip, your hair, 
                                 the visibility and how the ball travels. The ball won’t roll as well on a wet green or travel as far in the air."),
                               p("Temperatures - Most weather apps show the air temperature, so a temperature that would be measured in the shade, sheltered from the wind. 
                               Alongside can be a Feels Like temperature which takes into consideration the wind strength and humidity. 
                                 An air temperature of 61F can feel hugely different with a breeze and grey skies to a sheltered sunny spot.")
                               
                            ),
                      
                      #Tab panel 3
                      tabPanel("How it works",
                               p(h3("Prediction Methodology")),
                               
                               br(),
                               
                               p("There absolutely is such a thing as golf weather, 
                                          although that specific spectrum of perfectly playable weather conditions depends on where you live, 
                                          how creaky your body gets, what time of the year it is, 
                                          and how dedicated you are to the sport. 
                                          A vast majority of dedicated golfers love cooler weather with low humidity and no breeze 
                                          (or just a little bit of a breeze)."), 
                                   
                               p("The method used to predict the ideal golf day is to use", span("Random Forest.", style = "color:blue"), 
                                          "Random forests or random decision forests are an ensemble learning method for classification, 
                                          regression and other tasks that operate by constructing a multitude of decision trees at training time 
                                          and outputting the class that is the mode of the classes (classification) or mean prediction (regression) 
                                          of the individual trees."), 
                               
                               p("The weather dataset used contains 14 examples of weather condition
                                          suitable for playing a game of golf. The info on this data set can be found here:"),
                               a(href="https://datacadamia.com/data_mining/weather", "Click here for dataset info!"),
                              
                               br(),
                               br(),
                              
                               p("Once the dataset is downloaded we will fit the model and perform prediction on the test dataset.
                                 Please look at the about page to check out my code!"), 
                        ),
                      
                      #Tab panel 4
                      tabPanel("About",
                               p(h3("Created")),
                               p("28 July 2020"),
                               br(),
                               
                               p(h3("Aim")),
                               
                               p("Create and deploy on RStudio server a shiny application with associated supporting documentation 
                                 about a Machine Learning - Ensemble Learning method to predict whether to play a game of golf 
                                 with certain weather conditions."), 
                               
                               br(),
                              
                               p(h3("Authors")),
                               
                               p("Willianto Asalim"),
                               a(href="https://www.linkedin.com/in/willianto-asalim", "LinkedIn Profile"),
                               
                               
                               br(),
                               br(),
                               
                               p(h3("Code")),
                               p("Code and input data used to generate this Shiny mapping tool are available on Github"), 
                               
                               a(href="https://github.com/asalimw/playGolf_Prediction/tree/master/playGolfPrediction", "Click here to check out my code!"),
                               
                               br(),
                               br(),
                               
                               p(h3("Inspiration")),
                               p("Data Professor - Chanin Nantasenamat"), 
                               
                               br(),
                               br(),
                               
                               HTML("<h2><center>Thank You!</center></h2>")
                      )
                               
                      
                                
                  )
    )
)