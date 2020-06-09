nba=read.csv("all_seasons.csv")
library(mclust)
# This is the server logic of a Shiny web application. You can run the 
function(input, output, session) {
  
  
  nbaplot <- reactive({
    nba[, c(input$xvar, input$yvar)]
  })
  
  clusters <- reactive({
    Mclust(nbaplot(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    palette(c("#1B9E77", "#D95F02", "#7570B3", "#E7298A",
              "#66A61E", "#E6AB02", "#A6761D", "#0000FF", "#ABABAB"))
    
    par(mar = c(6, 5, 0, 2))
    plot(nbaplot(),
         col = clusters()$classification,
         pch = 1, cex = 3)
    points(clusters()$centers, pch = 3, cex = 3, lwd = 3)
  })
  output$descrip <- renderText({
      clusters()$parameters$mean
  })
  output$descrip1 <- renderText({
    clusters()$parameters$variance$sigma
  })
  
}
