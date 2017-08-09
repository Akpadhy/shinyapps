library(shiny)
library(ggplot2)
library(ggthemes)

# Define server logic 
shinyServer(function(input, output) {
  max_games = 200
  n = 50 #number of games on one click
  
  balls <- c(1, 1, 1, 0, 0)
  number_of_red_balls <- vector(mode = "integer", length = n*max_games)
  
  for (k in 1:(n*max_games)){
    s = sample(balls, 4, replace = T)
    number_of_red_balls[k] <- sum(s)
  }

  output$redPlot <- renderPlot({
    t = min(n*max_games, n*input$action)
    red = data.frame(number_of_red_balls[1:t])
    
    red = data.frame(number_of_red_balls[1:t])
    colnames(red) <- "red"
    
    r = red$red
    s = summary(factor(r, levels=c(0,1,2,3,4)))
    agg = sum(s)
    s = s/agg
    s = data.frame(s)
    s$x1 = c(0, 1, 2, 3, 4)
    ggplot(s, aes(x=factor(x1), y=s, width=0.45)) + geom_bar(stat="identity", colour="black",fill="#f98866") +
      theme_minimal() +
      coord_cartesian(ylim = c(0, 1)) + xlab("X (Number of red balls)") +
      ylab("Probability") + theme(legend.position = "none") + theme(text = element_text(size=14))
    
  })
  
  output$binomialPlot <- renderPlot({
    b = data.frame(x=c(0,1,2,3,4), prob=c(0.0256, 0.1536, 0.3456, 0.3456, 0.1296))
    ggplot(b, aes(x, prob, width=0.45)) + geom_bar(stat = "identity", colour="black", fill="#f98866") +
      coord_cartesian(ylim = c(0, 1)) + theme_minimal() + 
      xlab("X (Number of red balls)")+ ylab("Probability") + 
      theme(text = element_text(size=14))
  })
  
  output$num_red_balls <- renderTable({ 
    t = min(n*max_games, n*input$action)
    m = matrix(as.integer(number_of_red_balls[1:t]), ncol=10, byrow = T)

    })
  
  output$length <- renderPrint({ 
    input$action*n
    })
  
  output$mean <- renderPrint({ 
    t = min(n*max_games, n*input$action)
    c(avg_red_balls = round(mean(number_of_red_balls[1:t]), 2), expected_value= 2.38)
  })
})
