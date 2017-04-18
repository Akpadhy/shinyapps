library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Central Limit Theorem"),
  titlePanel(hr()), 
  
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      h3("Instructions"), 
      p("Choose the sample size n and number of samples N."),
      h4("Choose a sample size"), 
      br(),
      sliderInput("n",
                  "Sample size (n)",
                  min = 1,
                  max = 50,
                  value = 30), 
      hr(),
      h4("Choose the number of samples"),
      br(),
      sliderInput("N",
                  "Number of samples (N)",
                  min = 10,
                  max = 1000,
                  value = 300)
    ),
    
    
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Distribution of Income"), 
      plotOutput("popPlot"),
      h3("Sampling Distribution of Mean Incomes"), 
      p("The plots shows the sampling distribution of the mean incomes
        of a bank's 71,295 credit card applicants. It takes N number of samples of 
sample size n chosen by you and plots the distribution of sample means. Play around with some values of 
        sample size and number of observations to see the central limit theorem 
        in action."), 
      plotOutput("sampPlot") 
      
    )
  )
))