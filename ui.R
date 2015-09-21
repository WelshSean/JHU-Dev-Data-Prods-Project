library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Interactive Modelling mtcars Data"),
  sidebarPanel(
    h3("Select Covariants"),
    helpText("Select at least one covariant and click the *Evaluate Model* button."),
    checkboxGroupInput("idcvs", NULL,
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
    h3("Overview"),
    helpText("This application lets you investigate a linear model of the mtcars dataset.",
             "You can  add covariates that will be included in the model, when you evaluate the model,",
             "the coefficients will be returned along with the standard R linear model diagnostic plots."),
    h4("Modelling String"),
    helpText("The box below displays the string that will be supplied to the lm model in R as the formula."),
    verbatimTextOutput("oid2"),
    h4("Coefficients"),
    helpText("When the model is evaluated, the intercept and the coefficients calculated for each of the ",
             "covariants will be displayed below."),
    verbatimTextOutput("oid3"),
    helpText("When the model is evaluated, the standard R diagnostic plots for linear models are displayed below.",
             "See",
             a("this link", href="http://sphweb.bumc.bu.edu/otlt/MPH-Modules/BS/R/R5_Correlation-Regression/R5_Correlation-Regression7.html"),
             "for more details"),
    plotOutput("oplot")
  )
)
)