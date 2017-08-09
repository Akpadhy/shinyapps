library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  title = "Linear Regression",
  
  h3("Fitting a regression line"), 
  hr(),
  
  fluidRow(
    column(12,
           p("Change the value of beta0 and beta1 and observe how the line changes.")
          )
          ),
  
  br(),
  
  fluidRow(
    column(6,
           br(),
           sliderInput("b0",
                       "Beta0 (b0)",
                       min = -4,
                       max = 4,
                       value = 2, 
                       animate=animationOptions(interval=1000, loop=T))
    ),
    column(6,  
           br(),
           sliderInput("b1",
                       "Beta1 (b1)",
                       min = 0.1,
                       max = 1.5,
                       value = 0.4,
                       animate=animationOptions(interval=400, loop=T))
    )
  ),
  fluidRow(
    column(12,
           h5("Fitting a straight line", class = "text-center"),
           br(),
           plotOutput("popPlot")
    )
  ), 
hr()
))