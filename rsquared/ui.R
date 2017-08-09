library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  title = "Linear Regression",
  
  h3("R-squared, RSS and TSS"), 
  hr(),
  fluidRow(
    column(4, 
           radioButtons("radio", 
                        label = h3("Choose plot type"), 
                        choices = list("Show TSS" = 1, 
                                       "Show residuals" = 2, 
                                       "Show TSS and residuals" = 3),
                        selected = 1)),
    column(4,
           br(),
           sliderInput("b0",
                       "Beta0 (b0)",
                       min = -4,
                       max = 14,
                       value = 2, 
                       animate=animationOptions(interval=1000, loop=T))
    ),
    column(4,  
           br(),
           sliderInput("b1",
                       "Beta1 (b1)",
                       min = 0.0,
                       max = 1.4,
                       value = 0.8, 
                       animate=animationOptions(interval=500, loop=T))
    )
  ),
  br(), 
  fluidRow(
    column(3,
           verbatimTextOutput("metrics")
    ),
    column(9,
           h5("R-squared, RSS and TSS", class = "text-center"),
           br(),
           plotOutput("popPlot")
    )
    
  )
))