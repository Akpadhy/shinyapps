library(shiny)

shinyUI(fluidPage(
  
  title = "Expected Value",
  
  h3("Instructions"), 
  hr(),
  p("Click the button to play the game 50 times. After a sufficiently large number of games, 
    the observed distribution should be similar to the binomial distribution."),
  p("Note: Max 200 x 50 games are allowed"),
  actionButton("action", label="Play 50 times!", class="btn btn-danger text-center"),
  br(),
  
  hr(),
  
  fluidRow(
    column(12,
           p("The average and expected number of red balls:"),
           verbatimTextOutput("mean")
           
    )
  ),
  br(),
  
  fluidRow(
    column(6,
           h5("Observed Distribution", class="text-center"),
           br(),
           plotOutput("redPlot")
    ),
    column(6,  
           h5("Binomial Distribution", class="text-center"),
           br(),
           plotOutput("binomialPlot")
           
           
    )
  )
  
  
))