library(shiny)
library(ggplot2)
library(ggthemes)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  max_games = 30
  n = 10 #number of games on one click
  
  balls <- c(1, 1, 1, 0, 0)
  number_of_red_balls <- vector(mode = "integer", length = n*max_games)
  
  for (k in 1:(n*max_games)){
    s = sample(balls, 4, replace = T)
    number_of_red_balls[k] <- sum(s)
  }
  # Takes the value of 'action' from input 
  
  output$redPlot <- renderPlot({
    t = min(n*max_games, n*input$action)
    qplot(number_of_red_balls[1:t]) + xlab("X (Number of red balls)") +
      ylab("Frequency") + scale_x_continuous(breaks=c(0,1,2,3,4)) +
      coord_cartesian(xlim = c(0, 5)) + coord_cartesian(ylim = c(0, 100)) +
      theme_few()
    
  })
  
  output$num_red_balls <- renderPrint({ 
    t = min(n*max_games, n*input$action)
    number_of_red_balls[1:t] 
    })
  
  output$length <- renderPrint({ 
    input$action*n
    })
  
  
  output$mean <- renderPrint({ 
    t = min(n*max_games, n*input$action)
    c(avg_red_balls = round(mean(number_of_red_balls[1:t]), 2), expected_value= 2.45)
  })
  
  
  
})
