# Define UI for Quake Impact prediction application
shinyUI(pageWithSidebar(
    
    # Application title
    headerPanel("Quake Impact Predictor"),
    
    # Sidebar with controls to provide a caption, select a dataset, and 
    # specify the number of observations to view. Note that changes made
    # to the caption in the textInput control are updated in the output
    # area immediately as you type
    sidebarPanel(
    #    textInput("caption", "Caption:", "Data Summary"),
        
        selectInput("model", "Choose a prediction model:", 
                    choices = c("gbm", "rf", "knn")),
        
        sliderInput("trData", "Adjust training dataset size (in %)",
                    min = 50, max = 90, step = 5, value = 70),
        
        radioButtons("cv", "Select number of Cross Validations to be performed:",
                     c("3" = 3, "5" = 5, "10" = 10), inline=TRUE)
    #    numericInput("obs", "Number of observations to view:", 10)
    ),

    
    # Show the caption, a summary of the dataset and an HTML table with
    # the requested number of observations
    mainPanel(
        verbatimTextOutput("mod"), 
        
        plotOutput("dplot"),
        
        plotOutput("gplot")
    )
))