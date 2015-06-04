# ui.R
library(shiny)
# Define UI for application that pre-process the data
shinyUI(fluidPage(
        titlePanel("Data Pre-Processor"),
        sidebarLayout(
                sidebarPanel(
                        helpText("This app lets you select one of 3 datasets from the UsingR library. Once the dataset is selected, nrows is determined ",
                                 " to dynamically render a slider with range [1,nrow(dataset)] and a dataset summary is generated.",     
                                 " The dynamic slider defaults to 1, enabling you to select a number of data points to view in table form, between 1 (head) and nrow(dataset).",
                                 " Basic pre-processing can be performed on the data: Radio buttons choices can either display raw data, or process the data. ",
                                 " z-normal scaling, [0-1] scaling , or digital [-5,5] scaling can be selected. The corresponding data is calculated and the selected number",
                                 " of observations is tabulated automatically."),
                        selectInput("dataset", label="Choose a dataset:",
                                    choices= list("cement","chips", "chicken"), selected="cement"),
                        #display dynamic UI
                        uiOutput("slider"),
                        helpText("Note: Dataset Summary and processing are performed on the complete dataset.",
                                 "Tabular Observations data shows the selected number of data points (slider value) and process selected (radio button)."),
                        radioButtons("proc", "Processing type:",
                             c("Raw data" = "raw",
                               "z-normal scale" = "znorm",
                               "[0,1] scale" = "norm",
                               "[-5,5] scale" = "digital")),
                br() #,
               # submitButton("Update View")  #you don't need this 
                ),
                # Show a summary of the dataset and an HTML table with the 
                # requested number of observations
                mainPanel(
                        h4(textOutput("outid1")),
                        verbatimTextOutput("summary"),
                        h4(textOutput("outid2")),
                        tableOutput("view")
                )
        )
))
