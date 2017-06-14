#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(plotly)

# For dropdown menu
series = read.csv("series.csv")
series = unique(series$series_name) %>%
  sort()

fluidPage(
  titlePanel("Comparando séries por nota do episódio"),
  fluidRow(
    column(6,
           wellPanel(
             selectInput("series_name", "Escolha as séries", series, selected = "Sherlock", multiple = TRUE)
           )
    ),
    column(9,
           plotlyOutput("distPlot")
    )
  )
)