library(shiny)

shinyUI(fluidPage(
  
  title = "Expected Value",
  
  h3("Instructions"), 
  hr(),
  p("Click the button to play the game 30 times."),
  actionButton("action", label="Play 30 times!", class="btn btn-danger text-center"),
  br(),
  
  hr(),
  
  fluidRow(
    column(6,
           p("The average number of red balls is:"),
           verbatimTextOutput("mean")
           
    ), 
    column(6,
           p("The number of games played is:")),
           verbatimTextOutput("length")
  ),
  
  fluidRow(
    column(6,
           h5("Frequency distribution"),
           br(),
           plotOutput("redPlot")
    ),
    
    column(6, 
           h5("Expected Value"),
           br(), 
           plotOutput("exp_plot")
           )
    )
))