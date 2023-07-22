### FRONTEND

library(shiny)

fluidPage(

  # Subtitle
  h4("Server interaction"),
  
  # Action button
  actionButton("action_btn", "Push data"),
  
  # Output element to display the message
  verbatimTextOutput("message_output")
  
)