library(shiny)
library(caret)
shinyServer(function(input, output) {
        # Create ML models
        
        ## Training and testing sets
        set.seed(1234)
        inTrain <- createDataPartition(y=iris$Species,
                                       p=0.7, list=FALSE)
        training <- iris[inTrain,]
        testing <- iris[-inTrain,]
        
        ## Train model
        modRpart <- train(Species ~ .,method="rpart",data=training)

        ## Check accuracy
        predRpart <- predict(modRpart,newdata=testing)

        cm.Rpart <- confusionMatrix(data=predRpart, reference = testing$Species)
        Rpart.accuracy <- cm.Rpart$overall[['Accuracy']]
        
        output$AccTree <- renderText(Rpart.accuracy)
        
        # Make predictions
        modRpartpred <- reactive({
                Sepal.Length.Input <- input$sliderSepLength
                Sepal.Width.Input <- input$sliderSepWidth
                Petal.Length.Input <- input$sliderPetLength
                Petal.Width.Input <- input$sliderPetWidth
                predict(modRpart, newdata = data.frame(Sepal.Length = Sepal.Length.Input,
                                                        Sepal.Width = Sepal.Width.Input,
                                                        Petal.Length = Petal.Length.Input,
                                                        Petal.Width = Petal.Width.Input))
        })
        
        output$predTree <- renderText({
                as.character(modRpartpred())
        })
})