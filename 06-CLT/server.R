library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  bank <- read.csv("https://raw.githubusercontent.com/kshitijjain91/Credit-Risk-Capstone/master/datasets/Demogs_v1.csv")

  output$sampPlot <- renderPlot({
    # x    <- mtcars$mpg  # Old Faithful Geyser data
    # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # # draw the histogram with the specified number of bins
    # qplot(x)
    v = vector(mode="integer", length = input$N)
    # bank <- read.csv("https://raw.githubusercontent.com/kshitijjain91/Credit-Risk-Capstone/master/datasets/Demogs_v1.csv")
    income <- bank$Income
    
    for (sample_num in 1:input$N){
      s <- sample(income, input$n, replace=F)
      v[sample_num] <- mean(s)
    }
    
    v <- data.frame(v)
    ggplot(v, aes(v)) + geom_density() + 
      xlab("Sample Mean of Income") + ylab("Probability Density")+
      coord_cartesian(xlim=c(15,40))
    
    
  })
  output$popPlot <- renderPlot({
    # x    <- mtcars$mpg  # Old Faithful Geyser data
    # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # # draw the histogram with the specified number of bins
    # qplot(x)
    # bank <- read.csv("https://raw.githubusercontent.com/kshitijjain91/Credit-Risk-Capstone/master/datasets/Demogs_v1.csv")
    income <- bank$Income
    
    income <- data.frame(income)
    ggplot(income, aes(income)) + geom_density() + xlab("Income") + ylab("Probability Density")
    
  })
  
  output$stattable <- renderTable({
    income <- bank$Income
    pop_mean <- mean(income, na.rm=T)
    pop_sd_by_root_n <- sd(income, na.rm = T)/sqrt(input$n)
    
    v = vector(mode="integer", length = input$N)
    
    for (sample_num in 1:input$N){
      s <- sample(income, input$n, replace=F)
      v[sample_num] <- mean(s)
    }
    
    mean_samp_means <- mean(v, na.rm = T)
    standard_error <- sd(v, na.rm=T)
    
    d = data.frame(pop_mean, mean_samp_means, pop_sd_by_root_n, standard_error)
    # colnames(d) <- c("Population Mean", "Mean of Sampling Distribution")
  })
  
  # output$sampmean <- renderPrint({
  #   income <- bank$Income
  #   v = vector(mode="integer", length = input$N)
  # 
  #   for (sample_num in 1:input$N){
  #     s <- sample(income, input$n, replace=F)
  #     v[sample_num] <- mean(s)
  #   }
  # 
  #   mean(v, na.rm = T)
  # })
  # 
})
