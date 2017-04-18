library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Expected Value"),
  titlePanel(hr()), 
  
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      h3("Instructions"), 
      hr(),
      p("Click the button to play the game 10 times."),
      br(),
      actionButton("action", label="Play 10 times!", class="btn btn-danger"),
      hr()
      
    ),
    
    
    
    # Show a plot of the generated distribution
    mainPanel(
      p("Mumber of red balls obtained in each game:"),
      fluidRow(column(12, verbatimTextOutput("num_red_balls"))),
      p("The average number of red balls is:"),
      fluidRow(column(12, verbatimTextOutput("mean"))),
      plotOutput("redPlot")
      
      
    )
  )
))