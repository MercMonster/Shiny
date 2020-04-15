# server.R

library(maps)
library(mapproj)

counties<-readRDS("data/counties.rds")

library(shiny)
source("helpers.R")



shinyServer(
  server <- function(input, output) {
    output$map <- renderPlot({
      var <- switch(input$var, 
                     "Percent White" = counties$white,
                     "Percent Black" = counties$black,
                     "Percent Hispanic" = counties$hispanic,
                     "Percent Asian" = counties$asian)
      
      color <- switch(input$var, 
                      "Percent White" = "darkgreen",
                      "Percent Black" = "black",
                      "Percent Hispanic" = "darkorange",
                      "Percent Asian" = "darkviolet")
      
      legend <- switch(input$var, 
                       "Percent White" = "% White",
                       "Percent Black" = "% Black",
                       "Percent Hispanic" = "% Hispanic",
                       "Percent Asian" = "% Asian")
      
      percent_map(var, color, legend, input$range[1], input$range[2])
    })
    
  }
  
)
