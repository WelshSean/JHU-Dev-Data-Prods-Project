library(shiny)
data("mtcars")
shinyServer(
  function(input, output){
    output$oid1 <- renderPrint({input$idcvs})
    output$oid2 <- renderPrint({paste(input$idcvs, collapse = "+")})
    #fit1  <- lm(mpg ~ paste(input$idcvs, collapse = "+")   , mtcars)
  }
)