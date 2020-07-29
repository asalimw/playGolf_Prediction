#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(data.table)
library(RCurl)
library(randomForest)

# Read data
weather <- read.csv(text = getURL("https://raw.githubusercontent.com/dataprofessor/data/master/weather-weka.csv") )
weather$outlook <- as.factor(weather$outlook)

# Build model
model <- randomForest(as.factor(play) ~ ., data = weather, ntree = 500, mtry = 4, importance = TRUE)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    # Input Data
    datasetInput <- reactive({  
        
        # outlook,temperature,humidity,windy,play
        df <- data.frame(
            Name = c("outlook",
                     "temperature",
                     "humidity",
                     "windy"),
            Value = as.factor(c(input$outlook,
                                input$temperature,
                                input$humidity,
                                input$windy)),
            stringsAsFactors = FALSE)
        
        input <- transpose(df)
        write.table(input,"input.csv", sep=",", quote = FALSE, row.names = FALSE, col.names = FALSE)
        
        test <- read.csv(paste("input", ".csv", sep=""), header = TRUE)
        
        test$outlook <- factor(test$outlook, levels = c("overcast", "rainy", "sunny"))
        
        
        Output <- data.frame(Prediction=predict(model,test), round(predict(model,test,type="prob"), 3))
        print(Output)
        
    })
    
    # Status/Output Text Box
    output$contents <- renderPrint({
        if (input$submitbutton>0) { 
            isolate("Calculation complete.") 
        } else {
            return("Please click the submit button.")
        }
    })
    
    # Prediction results table
    output$tabledata <- renderTable({
        if (input$submitbutton>0) { 
            isolate(datasetInput()) 
        } 
    })
})
