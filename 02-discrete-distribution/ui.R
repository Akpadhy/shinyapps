library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Probability Distribution - Discrete Random Variable"),
  titlePanel(hr()), 
  
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      h3("Instructions"), 
      hr(),
      p("Click the button to simulate the game once."),
      br(),
      actionButton("action", label="Pick 4 balls!", class="btn btn-danger"),
      hr(),
      p("The vector of number of red balls is printed below."),
      fluidRow(column(12, verbatimTextOutput("value")))
      
    ),
    
    
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Number of Red Balls - Distribution"), 
      p("Number of games played (max limit 100):"), 
      fluidRow(column(12, verbatimTextOutput("length"))),
      plotOutput("redPlot")
      
      
    )
  )
))