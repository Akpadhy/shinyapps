library(shiny)

shinyUI(fluidPage(
  
  title = "Expected Value",
  
  h3("Instructions"), 
  hr(),
  p("Pick 4 balls and compare the frequency and the probability distributions."),
  actionButton("action", label="Pick 4 balls!", class="btn btn-danger text-center"),
  br(),
  
  br(),
  
  fluidRow(
    p("The number of red balls obtained in each experiment:", class="container-fluid"),
    column(12,
           verbatimTextOutput("value"))
  ),
  
  br(),
  br(),
  br(),
  
  fluidRow(
    column(6,
           h5("Frequency distribution", class = "text-center"),
           br(),
           plotOutput("redPlot")
    ),
    column(6,  
           h5("Probability distribution", class = "text-center"),
           br(),
           plotOutput("probPlot")
           
    )
  )
  
  
))