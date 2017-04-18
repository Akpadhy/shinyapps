library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$sampPlot <- renderPlot({
    # x    <- mtcars$mpg  # Old Faithful Geyser data
    # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # # draw the histogram with the specified number of bins
    # qplot(x)
    v = vector(mode="integer", length = input$N)
    bank <- read.csv("https://raw.githubusercontent.com/kshitijjain91/Credit-Risk-Capstone/master/datasets/Demogs_v1.csv")
    income <- bank$Income
    
    for (sample_num in 1:input$N){
      s <- sample(income, input$n, replace=F)
      v[sample_num] <- mean(s)
    }
    
    v <- data.frame(v)
    ggplot(v, aes(v)) + geom_density() + xlab("Sample mean") + ylab("Probability Density")
    
  })
  output$popPlot <- renderPlot({
    # x    <- mtcars$mpg  # Old Faithful Geyser data
    # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # # draw the histogram with the specified number of bins
    # qplot(x)
    bank <- read.csv("https://raw.githubusercontent.com/kshitijjain91/Credit-Risk-Capstone/master/datasets/Demogs_v1.csv")
    income <- bank$Income
    
    income <- data.frame(income)
    ggplot(income, aes(income)) + geom_density() + xlab("Income") + ylab("Probability Density")
    
  })
})
