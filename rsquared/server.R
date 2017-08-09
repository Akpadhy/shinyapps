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
      tss = (y0 - mean(y0))^2
      rss = (y - y0)^2
      d = data.frame(x, y0, y, e, ybar=mean(y0))
      
      
      if (input$radio == "3"){
        ggplot(d, aes(x=x)) + 
          geom_point(aes(y = y0), colour = "red", size = 2) + 
          geom_point(aes(y = y), colour = "black") + geom_line(aes(y = y), colour = "black")+
          xlab("x") + ylab("y")+geom_hline(yintercept = mean(d$y0), linetype = "dashed")+
          scale_y_continuous(limits = c(-10, 50))+
          geom_segment(aes(xend = x, yend = y, x = x, y = y0), color = "gray")+
          geom_segment(aes(xend = x, yend = mean(y0), x = x, y = y0), color = "orange")+
          theme_minimal()
      
        
      } else if (input$radio == "1") {
        ggplot(d, aes(x=x)) + 
          geom_point(aes(y = y0), colour = "red", size = 2) + 
          geom_line(aes(y = y), colour = "black")+
          scale_y_continuous(limits = c(-10, 50))+
          xlab("x") + ylab("y")+geom_hline(yintercept = mean(d$y0), linetype = "dashed")+
          geom_segment(aes(xend = x, yend = mean(y0), x = x, y = y0), color = "orange")+
          theme_minimal()
        
      } else if (input$radio == "2") {
        ggplot(d, aes(x=x)) + 
          geom_point(aes(y = y0), colour = "red", size = 2) + 
          geom_point(aes(y = y), colour = "black") + geom_line(aes(y = y), colour = "black")+
          scale_y_continuous(limits = c(-10, 50))+
          xlab("x") + ylab("y")+geom_hline(yintercept = mean(d$y0), linetype = "dashed")+
          geom_segment(aes(xend = x, yend = y, x = x, y = y0), color = "gray")+
          theme_minimal()
        
      } else {
        return(NULL)
      }
      
      
    })
    
    output$metrics <- renderPrint({
      b0 = input$b0
      b1 = input$b1
      x =  c(1, 2, 4, 6, 7, 8, 10, 12, 14, 16, 18, 19, 22, 25)
      y0 = c(3, 7, 6, 9, 6, 7, 11, 13, 14, 18, 14, 18, 25, 27)
      y = b0 + b1*x
      e = y - y0
      tss = (y0 - mean(y0))^2
      rss = (y - y0)^2
      d = data.frame(x, y0, y, e, ybar=mean(y0), tss, rss)
      
      RSS = round(sum(d$rss), 2)
      TSS = round(sum(d$tss), 2)
      Rsq = round((1 - (RSS/TSS)), 2)
      return(c(RSS = RSS, TSS = TSS, Rsquared = Rsq))
    })
  
})
