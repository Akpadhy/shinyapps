library(shiny)
library(ggplot2)
library(ggthemes)

# Define server logic required to draw population density plot
shinyServer(function(input, output) {
  
  output$popPlot <- renderPlot({
    
    b0 = input$b0
    b1 = input$b1
    x = c(190, 240, 300, 160, 200, 269, 129, 141, 220, 337)
    y0 = c(0,1, 1, 0,1,1, 0, 0, 0, 1)
    y = 1/(1+exp(-b0-b1*x))
    d = data.frame(x, y0, y)
    
    ggplot(d, aes(x=x)) + 
      geom_point(aes(y = y0, colour = factor(y0)), size = 3) + 
      geom_point(aes(y = y), colour = "black") + geom_line(aes(y = y), colour = "black")+
      geom_text(aes(label=round(y, 2)), data = d, x = x, y = y, hjust = -0.8)+
      xlab("Blood Sugar Level (mg/dl)")+ ylab("Diabetes")+
      theme_minimal()
  })
})
