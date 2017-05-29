#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Sequencing Prediction Using Markov Chains"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        textInput("sentence", label=h4("your words..."), 
                  value=""),
        hr(),
        uiOutput("radiobuttons"),
        hr(),
        helpText("Yes. That is right. I can predict the future and I can read your mind."),
        helpText("Actually, I can't. But my friend Markov can."),
        helpText("To try it, just",
                 "type a sentence in English on the first form above. We will provide a list of words that you might be",
                 "typing next. Make a selection of the word above and keep typing."),
        helpText("On the right you will see a distribution of the alternatives we found so far and how certain we",
                 "are about each of them. Have fun!")
        
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       hr(),
       helpText("This is a demonstration of the use of Markov Chains for the prediction of sequenced events.",
                "This type of prediction assumes that a probability of an event ocurring at time t is affected by",
                "previous events that occurred from 0 to t-1. This techinique is used on several domains like genetic",
                "sequencing, speech recognition (this noble example here) and my favorite: prediction of next price tick",
                "in financial time series and random walks.")
    )
  )
))
