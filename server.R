#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(readr)

series = read_csv("series.csv")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlotly({
    plot_ly(data = filter(series, series_name %in% input$series_name),
                      x = ~series_ep,
                      y = ~UserRating,
                      color = ~series_name,
                      text = ~paste("<br>Série: ", series_name,
                                    "<br>Avaliação do Episódio: ", UserRating,
                                    "<br>Número do Episódio: ", season_ep,
                                    "<br>Season: ", season),
                      type = 'bar'
    )  %>%
      layout(
        xaxis = list(title = "Episódio"),
        yaxis = list(title = "Nota"),
        boxmode = "group"
      )
    })
  
})
