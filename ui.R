ui <- fluidPage(
  
  # App title
  titlePanel("Hotel Survey"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    
    # Sidebar panel for inputs
    sidebarPanel(
      
      # Input: Slider for hotel ratings
      sliderInput(inputId = "ratings",
                  label = "Overall rating",
                  min = 1,
                  max = 10,
                  value = 5),
      
      # Action: submit new data
      actionButton(inputId = "submit",
                   label = "Submit")
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      
      # Output: Histogram
      plotOutput(outputId = "distPlot")
      
    )
  )
)
