library(UsingR)
library(shiny)
data(Medicare)
mydata <- aggregate(Average.Covered.Charges ~ region + DRG.Definition, Medicare,  sum)
Resp <- subset(mydata, DRG.Definition == "176 - PULMONARY EMBOLISM W/O MCC" | DRG.Definition == "177 - RESPIRATORY INFECTIONS & INFLAMMATIONS W MCC" | DRG.Definition == "178 - RESPIRATORY INFECTIONS & INFLAMMATIONS W CC" | DRG.Definition == "189 - PULMONARY EDEMA & RESPIRATORY FAILURE" | DRG.Definition == "190 - CHRONIC OBSTRUCTIVE PULMONARY DISEASE W MCC" | DRG.Definition == "191 - CHRONIC OBSTRUCTIVE PULMONARY DISEASE W CC" | DRG.Definition == "192 - CHRONIC OBSTRUCTIVE PULMONARY DISEASE W/O CC/MCC" | DRG.Definition == "194 - SIMPLE PNEUMONIA & PLEURISY W CC" | DRG.Definition == "193 - SIMPLE PNEUMONIA & PLEURISY W MCC" | DRG.Definition == "195 - SIMPLE PNEUMONIA & PLEURISY W/O CC/MCC" | DRG.Definition == "202 - BRONCHITIS & ASTHMA W CC/MCC" | DRG.Definition == "203 - BRONCHITIS & ASTHMA W/O CC/MCC" |DRG.Definition == "207 - RESPIRATORY SYSTEM DIAGNOSIS W VENTILATOR SUPPORT 96+ HOURS" | DRG.Definition == "208 - RESPIRATORY SYSTEM DIAGNOSIS W VENTILATOR SUPPORT <96 HOURS")
Cardio <- subset(mydata, DRG.Definition == "238 - MAJOR CARDIOVASC PROCEDURES W/O MCC" |DRG.Definition == "243 - PERMANENT CARDIAC PACEMAKER IMPLANT W CC" | DRG.Definition == "244 - PERMANENT CARDIAC PACEMAKER IMPLANT W/O CC/MCC" |DRG.Definition == "246 - PERC CARDIOVASC PROC W DRUG-ELUTING STENT W MCC OR 4+ VESSELS/STENTS" | DRG.Definition == "247 - PERC CARDIOVASC PROC W DRUG-ELUTING STENT W/O MCC" | DRG.Definition == "249 - PERC CARDIOVASC PROC W NON-DRUG-ELUTING STENT W/O MCC" | DRG.Definition == "251 - PERC CARDIOVASC PROC W/O CORONARY ARTERY STENT W/O MCC" | DRG.Definition == "252 - OTHER VASCULAR PROCEDURES W MCC" | DRG.Definition == "291 - HEART FAILURE & SHOCK W MCC" | DRG.Definition == "292 - HEART FAILURE & SHOCK W CC" | DRG.Definition == "293 - HEART FAILURE & SHOCK W/O CC/MCC" )
Drugs <- subset(mydata, DRG.Definition == "897 - ALCOHOL/DRUG ABUSE OR DEPENDENCE W/O REHABILITATION THERAPY W/O MCC" | DRG.Definition == "917 - POISONING & TOXIC EFFECTS OF DRUGS W MCC" |DRG.Definition == "918 - POISONING & TOXIC EFFECTS OF DRUGS W/O MCC")
shinyServer(
  function(input, output) {
    output$newPlot <- renderPlot({
      x <- input$DGlabel
      if ( x == "Respiratory")
      {with(Resp, plot(region, Average.Covered.Charges, main = "Respiratory Disease - USA Geographic Region to Avg Covered Charges",pch = 10)) 
      }
        else 
        {with(Cardio, plot(region, Average.Covered.Charges, main = "Cardiac Disease - USA Geographic Region to Avg Covered Charges",pch = 10)) 
        }
          })
    output$newHist <- renderPlot({
      x <- input$DGlabel
      if ( x == "Respiratory")
      {hist(Resp$Average.Covered.Charges, xlab='Average.Covered.Charges', col='lightblue',main='Respiratory Disease Histogram')
      RMean <- input$RMean
      lines(c(RMean, RMean), c(0, 20),col="red",lwd=5)
      }
        else
        {hist(Cardio$Average.Covered.Charges, xlab='Average.Covered.Charges', col='lightblue',main='Cardiac Disease Histogram')
          CMean <- input$CMean
          lines(c(CMean, CMean), c(0, 20),col="red",lwd=5)
        }  
    })
    
    }
)
