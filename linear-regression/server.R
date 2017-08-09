library(shiny)
library(ggplot2)
library(ggthemes)

# Define server logic required to draw population density plot
shinyServer(function(input, output) {
  
  output$popPlot <- renderPlot({
    
    b0 = input$b0
    b1 = input$b1
    x =  c(1, 2, 4, 6, 7, 8, 10, 12, 14, 16, 18, 19, 22, 25)
    y0 = c(3, 7, 6, 9, 6, 7, 11, 13, 14, 18, 14, 18, 25, 27)
    y = b0 + b1*x
    e = y - y0
    d = data.frame(x, y0, y, e, ybar=mean(y0))
    
    ggplot(d, aes(x=x)) + 
      geom_point(aes(y = y0), colour = "red", size=2) + 
      geom_point(aes(y = y), colour = "black") + geom_line(aes(y = y), colour = "black")+
      scale_y_continuous(limits = c(-10, 50))+
      xlab("x") + ylab("y")+
      theme_minimal()
      
  })
})
