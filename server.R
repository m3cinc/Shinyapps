# server.R

library(shiny)
library(UsingR)
# Define the norming functions implemented in this app
raw<-function (x) {return(x)} # Reload raw dataset
normalize<-function (x) {return((x-min(x))/(max(x)-min(x)))} # straight norming
digitalize<-function (x) {return((10*(x-min(x))/(max(x)-min(x)))-5)} # for A/D use 
# Define server logic required to summarize and view the selected dataset

shinyServer(function(input, output) {
        
        # Return the requested dataset
        datasetInput <- reactive({
                switch(input$dataset,
                       "cement" = cement,
                       "chicken" = chicken,
                       "chips" = chips)
        })
        
        # Render the selected dataset name
        output$outid1<-renderText({
                text<-paste("Selected:",input$dataset)
                text<-paste(text," Dataset Summary")
        })
        
        # Generate a summary of the dataset
        output$summary <- renderPrint({
                dataset <-datasetInput()
                process <-processInput()
                nmax <-nrow(dataset)
                dataset<-as.data.frame(lapply(dataset,process))
                summary(dataset)
        })
        
        #make dynamic slider
        output$slider <- renderUI({
                         dataset<-datasetInput()
                         sliderInput("inslider","Number of Data Points to view:",min=1,max=nrow(dataset),step=1,round=TRUE,ticks=FALSE,value=1)
        })
        
        # Return the requested process
        processInput <- reactive({
                proc<-switch(input$proc,
                                raw = raw, 
                                znorm = scale,
                                norm = normalize,
                                digital = digitalize,
                                raw)
        })
        
        
        # Wrap the functionality into a reactive block and call the function this way
        viewTable <- reactive({
            dataset<-datasetInput()
            process<-processInput()
            dataset<-as.data.frame(lapply(dataset,process))
            head(dataset, max(1,input$inslider))
        })
        
        # Render the selected  number of datapoints
        output$outid2<-renderText({
                text<-paste("Selected:",max(1,input$inslider))
                text<-paste(text,"Observation")
                text<-ifelse(input$inslider>1,paste0(text,"s"),text)
                text<-paste0(text,", starting at Head of Dataset:")
                })
        
        # Show the first selected observations
        output$view <- renderTable({
            viewTable()
        })
})
