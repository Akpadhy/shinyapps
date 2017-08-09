library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  title = "Logistic Regression",
  
  h3("Likelihood - Sigmoid Curve"), 
  hr(),
  
  fluidRow(
    column(12,
           p("Change the value of beta0 and beta1 and observe how the curve changes.")
          )
          ),
  
  br(),
  
  
  fluidRow(
    column(6,
           br(),
           sliderInput("b0",
                       "Beta0 (b0)",
                       min = -15,
                       max = -8,
                       value = -12, 
                       round = FALSE, 
                       animate=animationOptions(interval=1000, loop=T))
    ),
    column(6,  
           br(),
           sliderInput("b1",
                       "Beta1 (b1)",
                       min = 0.025,
                       max = 0.070,
                       value = 0.050, 
                       animate=animationOptions(interval=500, loop=T))
    )
  ),
  fluidRow(
    column(12,
           h5("Sigmoid Curve - Diabetes and Blood Sugar Level", class = "text-center"),
           br(),
           plotOutput("popPlot")
    )
  ), 
hr()
))