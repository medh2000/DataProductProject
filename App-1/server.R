
library(UsingR)

# load mt cars 
data(mtcars)

attach(mtcars)

# Function returns a car weight bases on the  regression line equation
# y = mx + b
# y : car weight
# m: slope
# b: y-intercept
carWeight <- function(weight) {
       
                (weight * -5.344) + 37.285
         
           }    
##########################################################
shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$weight})
   
   
    output$prediction <- renderPrint({carWeight(input$weight)})
    output$radioValue <- renderPrint({input$radio})  
    output$carWeight <- renderPlot({
      plot(wt, mpg, main="Scatterplot Weigtth ", 
           xlab="Car Weight ", ylab="Miles Per Gallon ", pch=19)
      abline(lm(mpg~wt), col="red") # regression line (y~x) 
      lines(lowess(wt,mpg), col="blue") # lowess line (x,y)
    })
  }
)