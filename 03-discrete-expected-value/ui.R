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
    column(12,
           p("The average number of red balls is:"),
           verbatimTextOutput("mean")
           
    )
  ),
  
  fluidRow(
    column(6,
           h5("Frequency distribution"),
           br(),
           plotOutput("redPlot")
    ),
    
    column(6, 
           h5("Expected Value"),
           plotOutput("exp_plot")
           )
    )
    # column(6,  
    #        h5("Number of red balls obtained in each game:"),
    #        br(),
    #        tableOutput("num_red_balls")
    #        
    # )
  
  
  # fluidRow(
  #   column(12,
  #          plotOutput("exp_plot"))
  # )
  
  
))