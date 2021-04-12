library(tidyverse)
library(shiny)

#SHINY HW 10
#Question 2

ui <- fluidPage(
  titlePanel("mtcars data"),
  textOutput("text"),
  verbatimTextOutput("code"),
  checkboxGroupInput("variables", "For which mtcars variable is mean>median?",
                choices = names(mtcars))
)

server <- function(input, output, session) {
  output$text <- renderText({
    "mtcars summaries"
  })
  
  output$code <- renderPrint({
    summary(mtcars)
  })
}

shinyApp(ui = ui, server = server)
