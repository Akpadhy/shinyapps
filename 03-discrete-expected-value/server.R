library(shiny)
library(ggplot2)
library(ggthemes)

nodata <- data.frame(avg_red_balls= numeric(0), exp_value= numeric(0), num_games = integer(0))

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  max_games = 40
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
    qplot(number_of_red_balls[1:t], fill="#98866", binwidth=0.30, col=I("black")) + xlab("X (Number of red balls)") +
      ylab("Frequency") + scale_x_continuous(breaks=c(0,1,2,3,4)) +
      coord_cartesian(xlim = c(0, 5)) + coord_cartesian(ylim = c(0, 200)) +
      theme_minimal()+theme(legend.position="none")+theme(text = element_text(size=12))
    
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
  
  output$exp_plot <- renderPlot({ 
    t = min(n*max_games, n*input$action)
    # # d = data.frame(round(mean(number_of_red_balls[1:t]), 2), 2.38)
    # nodata <- rbind(nodata, c(round(mean(number_of_red_balls[1:t]), 2), 2.38, t))
    # colnames(nodata) <- c("avg_red_balls", "exp_value", "num_games")
    # ggplot(nodata, aes(x=num_games, y=avg_red_balls)) + geom_point()
    num_games <- seq(0, t, n)
    avg <- vector(mode = "numeric",length=length(num_games))
    
    for (i in 1:length(avg)){
      avg[i] <- mean(number_of_red_balls[1:i*n])
    }
    
    exp_value <- rep(2.38, length(avg))
    
    data <- data.frame(num_games, avg, exp_value)
    ggplot(data, aes(x=num_games)) + 
      geom_line(aes(y = avg, colour = "Average value")) + 
      geom_line(aes(y = exp_value, colour = "Expected value"))+
      coord_cartesian(xlim = c(0, 400)) + coord_cartesian(ylim = c(0, 4)) +
      theme_classic()+theme(text = element_text(size=12))+
      scale_x_continuous(breaks=seq(0, 400, 10)) + xlab("Number of games")+ylab("Average and Expected value")
    
    
  })
  
  
  
})
