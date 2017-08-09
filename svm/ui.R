shinyUI(pageWithSidebar(
  headerPanel("Support Vector Machine"),
  sidebarPanel(
    
    sliderInput('C', 'Training parameter C', value = 10, min = 0.1, max = 100, step = 0.5),
    sliderInput('gamma', 'Training parameter gamma', value = 1, min = 0.001, max = 20, step = 0.05),
    radioButtons("kernel", "Kernel",
                 c("linear" = "linear",
                   "polynomial" = "polynomial",
                   "radial" = "radial"), selected = "linear")
    ),
  mainPanel(
    plotOutput('newPlot')
    
  )
))