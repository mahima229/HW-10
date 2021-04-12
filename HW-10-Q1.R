library(tidyverse)
library(shiny)

#SHINY HW 10
#Question 1
data("mtcars")
ui <- fluidPage(
  titlePanel("Mtcars Histograms"),
  selectInput("vars", "mtcars variables", choices = names(mtcars)),
  plotOutput("plot")
)
server <- function(input, output, session) {
  data("mtcars")
  output$plot <- renderPlot({
    ggplot(mtcars, aes(x = get(input$vars))) +
      geom_histogram(fill="red")+
       xlab(input$vars)
  })
}
shinyApp(ui = ui, server = server)
