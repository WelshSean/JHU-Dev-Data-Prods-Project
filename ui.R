library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Interactive Modelling mtcars Data"),
  sidebarPanel(
    h3("Select Covariants"),
    checkboxGroupInput("idcvs", "Checkbox",
                       c("cyl" = "cyl",
                         "disp" = "disp",
                         "hp" = "hp",
                        "drat" = "drat",
                        "wt" = "wt",
                        "qsec" = "qsec",
                        "vs" = "vs",
                        "am" = "am",
                        "gear" = "gear",
                        "carb" = "carb")),
    actionButton("calcbutton", "Evaluate Model")
  ),
  mainPanel(
    h3("Main Panel text"),
    h4("You entered"),
    verbatimTextOutput("oid1"),
    h4("Modelling String"),
    verbatimTextOutput("oid2"),
    h4("Coefficients"),
    verbatimTextOutput("oid3"),
    plotOutput("oplot")
  )
)
)