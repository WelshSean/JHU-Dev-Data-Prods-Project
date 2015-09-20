library(shiny)
library(ggfortify)
library(ggplot2)
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
    
    output$oplot <- renderPlot({
      if (is.null(model1())) return()
      par(mfrow = c(2, 2))
      
      plot(m, which = 1:4, caption = c("Residuals vs Fitted", "Normal Q-Q plot", "Scale-Location plot", 
                          "Cook's distance plot"), panel = points, sub.caption = deparse(m$call), main = "",
                          ask = prod(par("mfcol")) < length(which) && dev.interactive(),
           id.n = 3, labels.id = names(residuals(m)), cex.id = 0.75)
      #plot(mtcars$mpg,mtcars$cyl)
    })
  }
)