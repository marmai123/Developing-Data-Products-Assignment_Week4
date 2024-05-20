library(shiny)
shinyUI(fluidPage(
        titlePanel("Predict Species with Machine Learning"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderSepLength", "What is the Sepal length?", 0.1, 8.0, value = 6.0),
                        sliderInput("sliderSepWidth", "What is the Sepal width?", 0.1, 5.0, value = 3.0),
                        sliderInput("sliderPetLength", "What is the Petal length?", 0.1, 7.0, value = 4.3),
                        sliderInput("sliderPetWidth", "What is the Petal width?", 0.1, 3.0, value = 1.3),

                ),
                mainPanel(
                        h3("Predicted Species:"),
                        textOutput("predTree"),
                        br(),
                        br(),
                        h4("Model accuracy"),
                        h5("Model accuracy Tree model:"),
                        textOutput("AccTree")
                        
                )
        )
))





