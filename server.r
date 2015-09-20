library(shiny)
data("mtcars")
shinyServer(
  function(input, output){
    output$oid1 <- renderText({input$idcvs})
    output$oid2 <- renderText({paste(input$idcvs, collapse = "+")})
 
    model1 <- eventReactive(input$calcbutton, {
      validate(
        need(input$idcvs != "", "Please select at least one Covariant")
      )
      lm(paste("mpg ~", paste(input$idcvs, collapse = "+"))   , mtcars)
    })

    output$oid3 <- renderText({model1()$coefficients})
  }
)