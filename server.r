library(shiny)
data("mtcars")
shinyServer(
  function(input, output){
    output$oid1 <- renderText({input$idcvs})
    output$oid2 <- renderText({paste(input$idcvs, collapse = "+")})
     #model1  <- reactive({
     #input$calcbutton
     #isolate(lm(mpg ~ paste(input$idcvs, collapse = "+")   , mtcars))
      # isolate(lm(mpg ~ cyl   , mtcars))
      #      })
    model1 <- eventReactive(input$calcbutton, {
      #paste("ZZZ", "YYY", "XXX")
      lm(paste("mpg ~", paste(input$idcvs, collapse = "+"))   , mtcars)
    })
    output$oid3 <- renderText({model1()$coefficients})
  }
)