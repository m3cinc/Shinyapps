# Shinyapps
Data Pre-Processor shinyapps for coursera

Basic Functionality of this Shynyapps
This app lets you select one of 3 datasets from the UsingR library. Once the dataset is selected, nrows is determined to dynamically render a slider with range [1,nrow(dataset)] and a dataset summary is generated. The dynamic slider defaults to 1, enabling you to select a number of data points to view in table form, between 1 (head) and nrow(dataset). Basic pre-processing can be performed on the data: Radio buttons choices can either display raw data, or process the data. z-normal scaling, [0-1] scaling , or digital [-5,5] scaling can be selected. The corresponding data is calculated and the selected number of observations is tabulated automatically.

Implementation
The standard implementation includes the ui.R and the server.R code

Features 

Self-contained datasets from UsingR
widgets
Dynamic slider
Dynamic table view
Preprocessing using z-scale,[0-1]scale and [-5,5] scale for different implementaion needs
Totally dynamic, and Error Free
Bonus add-on: This app also knows English Grammar, particularly knows how to apply plural...

RStudio Shinyapps and RStudio Presenter Presentation deck

A 5-slides presentation produced with RStudio Presenter is also included (DataPre-Processor.Rpres) and the corresponding .md and .html included.
The custom.css file and the various .png files are included as well.

You can launch the app at [here](https://m3cinc.shinyapps.io/App-3/) and view the Reproducible RStudio Presenter presentaion [here](http://rpubs.com/m3cinc/App3_Pres).
