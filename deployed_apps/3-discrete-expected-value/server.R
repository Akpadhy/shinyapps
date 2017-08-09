library(shiny)
library(ggplot2)
library(ggthemes)

nodata <- data.frame(avg_red_balls= numeric(0), exp_value= numeric(0), num_games = integer(0))

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  max_games = 50
  n = 30 #number of games on one click
  
  balls <- c(1, 1, 1, 0, 0)
  number_of_red_balls <- vector(mode = "integer", length = n*max_games)
  
  for (k in 1:(n*max_games)){
    s = sample(balls, 4, replace = T)
    number_of_red_balls[k] <- sum(s)
  }
  

  # Takes the value of 'action' from input 
  
  output$redPlot <- renderPlot({
    t = min(n*max_games, n*input$action)
    
    red = data.frame(number_of_red_balls[1:t])
    colnames(red) <- "red"
    
    
    r = red$red
    s = summary(factor(r, levels=c(0,1,2,3,4)))
    agg = sum(s)
    s = s/agg
    s = data.frame(s)
    s$x1 = c(0, 1, 2, 3, 4)
    ggplot(s, aes(x=factor(x1), y=s, width=0.32)) + geom_bar(stat="identity", fill="#f98866", colour="black") +
      theme_minimal() +
      coord_cartesian(ylim = c(0, 1)) + xlab("X (Number of red balls)") +
      ylab("Probability")+theme(legend.position = "none")+theme(text = element_text(size=14))
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
  
  output$length <- renderPrint({
    t = min(n*max_games, n*input$action)
    c(num_games=t)
  })
  
  output$exp_plot <- renderPlot({ 
    t = min(n*max_games, n*input$action)
    
    num_games <- seq(0, t, n)
    avg <- vector(mode = "numeric",length=length(num_games))
    
    for (i in 1:length(avg)){
      avg[i] <- mean(number_of_red_balls[1:(i*n)])
    }
    
    exp_value <- rep(2.38, length(avg))
    
    data <- data.frame(num_games, avg, exp_value)
    ggplot(data, aes(x=num_games)) + 
      geom_line(aes(y = avg, colour = "Average value")) + 
      geom_line(aes(y = exp_value, colour = "Expected value"))+
      coord_cartesian(xlim = c(0, 1200)) + coord_cartesian(ylim = c(1.5, 3)) +
      theme_classic()+theme(text = element_text(size=14))+
      scale_x_continuous(breaks=seq(0, 1200, 100)) + xlab("Number of games")+ylab("Average and Expected value")
  })
})
