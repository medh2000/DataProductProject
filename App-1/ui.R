shinyUI(fluidPage(
  pageWithSidebar(
    # Application title
    headerPanel("Mile Per Gallon prediction"),
    sidebarPanel(
      numericInput('weight', 'Enter car weight (tonnes)', 2, min = 1, max = 8, step = .5),
      radioButtons("radio", label = h3("Weight type"),
                   choices = list("Tons" = "Tons", "Pounds" = "Pounds"),selected = "Tons"),
    
      submitButton('Submit')
    ),
    mainPanel(
      
      
      h3('Results of Mile Per Gallon prediction'),
      h4('You entered'),
      verbatimTextOutput("inputValue"),
      h4('Tons or Pounds '),
      verbatimTextOutput("radioValue"),
      h4('Which resulted in a prediction of '),
      verbatimTextOutput("prediction"),
      h4("Scatter Plot of car weight in tonnes vs MIle Per Gallons"),
      plotOutput('carWeight')
    )
  )
))