shinyUI(fluidPage(
  titlePanel("USA region Geographic vs. Economic Cost impact on Selective Disease"),
    fluidRow(
      h5("Author : Sarabjeet Singh, Date : June 21, 2015"),  
      
      h4("Project Overview"),
      h5("This project is a unique study on USA region Geographic vs. Economic Cost impact on Selective Disease.", align = "left"),
      h5("The project used Medicare database consisting of 10,000 records, 
         Extracted records subsets based on two prominent disease profiles - various categories of disease clubbed under Respiratory and Cardiac", align = "left"),
      h5("Other paremeters used are -   
         USA regions of North East, North Central, South and West as per regions recorded in Medicatre database,   
         Extracted sum of Average Covered Charges on above categories", align = "left"),
      h4("Operation Guidelines"),
      h5("Operation requires user input through two widgets below - 1. Radio Button to select Disease Group and 2. Slider to select Mean value"),
      headerPanel("Disease Group"),
  radioButtons("DGlabel", label = h5("Select Disease Group from below options.   
                                     Based on this option a chart is displayed on Average Covered Charges for respective regions. This shows the Disease Cost impact on the region."),
                      choices = list("Respiratory" , "Cardiac") ,
                                     selected = "Respiratory")),
  sidebarPanel(
    sliderInput('RMean', 'Respiratory Disease Mean Value',value = 200000, min = 0, max = 4000000, step = 100000)
  ),
  sidebarPanel(
    sliderInput('CMean', 'Cardiac Disease Mean Value',value = 500000, min = 200000, max = 2000000, step = 100000)
    ),
  h5("Two Slider button options are provided to check the mean value on second chart i.e. Histogram of Avg Covered Charges."),
  h5("Only one of the two slider has to be used as per option selected in radio button for Disease Group.    
       The effect of the corresponding slider can be seen in Historam charts below."),
  
  mainPanel(
    plotOutput('newPlot'),
    plotOutput('newHist')
  )
))
