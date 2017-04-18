library(shiny)
library(ggplot2)
library(ggthemes)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  trials = 100
  
  balls <- c(1, 1, 1, 0, 0)
  number_of_red_balls <- vector(mode = "integer", length = trials)
  
  for (n in 1:trials){
    s = sample(balls, 4, replace = T)
    number_of_red_balls[n] <- sum(s)
    
  }
  # Takes the value of 'action' from input 
  
  output$redPlot <- renderPlot({
    t = min(trials, input$action)
    qplot(number_of_red_balls[1:t]) + xlab("X (Number of red balls)") +
      ylab("Frequency") + scale_x_continuous(breaks=c(0,1,2,3,4)) +
      coord_cartesian(xlim = c(0, 5)) + coord_cartesian(ylim = c(0, 20)) + 
      theme_few()
    
  })
  
  output$value <- renderPrint({ 
    number_of_red_balls[1:min(trials,input$action)] 
    })
  
  output$length <- renderPrint({ 
    length(number_of_red_balls[1:min(trials, input$action)]) 
    })
  
  output$plot1 <- renderPlot({
    qplot(sample(1:100, 50))
  })
  
})
