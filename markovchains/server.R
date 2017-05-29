#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

source('prediction.R')

noSelection <- '<<no selection>>'

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
    
    reactiveUserInput <- reactive({
        userInput <- input$sentence
        cat(file=stderr(), sprintf("user input changed: userInput='%s'\n", userInput))
        selection <- input$selection
        if (typeof(selection) == 'character' && selection != noSelection) {
             userInput <- paste(userInput, selection)
             updateTextInput(session, "sentence", value=userInput)
        }
        cat(file=stderr(), sprintf("user input changed: userInput='%s', selection='%s'\n", userInput, selection))
        userInput
    })
    
    reactiveDf <- reactive({
        userInput <- reactiveUserInput()
        cat(file=stderr(), sprintf("reactive user input changed, re-prediting: userInput='%s'\n", userInput))
        parsed <- parseUserInput(userInput)
        predictNextWord(parsed$sentence, parsed$prefix)
    })
    
    output$sentence <- renderText({
        userInput <- reactiveUserInput()
        cat(file=stderr(), sprintf("reactive user input changed, re-prediting: userInput='%s'\n", userInput))
        userInput
    })


  output$distPlot <- renderPlot({
      cat(file=stderr(), "df changed, re-plotting\n")
      p <- reactiveDf()
      # hack to order X by value of Y
      p$ngrams <- factor(p$ngrams, levels=p$ngrams[order(-p$prop)])
      ggplot(p, aes(x=ngrams, y=prop)) +
          theme_light() +
          geom_bar(stat='identity') +
          theme(axis.text.x = element_text(angle = 90, hjust = 1),
                axis.title.x = element_blank(),
                axis.title.y = element_blank())
  })
  
  output$radiobuttons <- renderUI({
      cat(file=stderr(), "df changed, re-labelling buttons\n")
      df <- reactiveDf()
      
      radioButtons("selection", "...my predictions for your next words, pick one", 
                   as.list(c(noSelection, 
                             sapply(df$ngrams, function(x) {
                                 w <- unlist(strsplit(x, ' '))
                                 w[length(w)]
                             })))
      )
  })
  
  output$predition1 <- renderDataTable({
      cat(file=stderr(), "sentence1 changed:", input$sentence, "\n")
      df <- predictNextWord(input$sentence, '') # FIXME
      df
  })
  
  output$predition <- renderTable({
      cat(file=stderr(), "sentence table changed:", input$sentence, "\n")
      df <- predictNextWord(input$sentence, '') # FIXME
      df
  })
  
})
