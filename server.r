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
      
      #output$oid3 <- renderText({model1()$coefficients})
    })

    output$oid3 <- renderText({
      if (is.null(input$idcvs)) return()
      #model1()$coefficients
      oo <- NULL
      for (i in names(model1()$coefficients)){
        oo <- c(oo,paste(c(i,model1()$coefficients[i]),collapse = ": "))
      }
      oo
      })

    
    output$oplot <- renderPlot({
      if (is.null(input$idcvs)) return()
      par(mfrow = c(2, 2))
      plot(model1(), which = 1:4, caption = c("Residuals vs Fitted", "Normal Q-Q plot", "Scale-Location plot", 
                          "Cook's distance plot"), panel = points, sub.caption = deparse(model1()$call), main = "",
                          ask = prod(par("mfcol")) < length(which) && dev.interactive(),
           id.n = 3, labels.id = names(residuals(model1())), cex.id = 0.75)
      #plot(mtcars$mpg,mtcars$cyl)
    })
  }
)