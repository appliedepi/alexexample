### BACK END

# library(shiny)
# library(DBI)
# library(dplyr)


function(input, output) {
  # Server logic goes here

  # Action button event observer
  observeEvent(input$action_btn, {

#
#     ## an example dataframe that would come from shiny or wherever
#     ## classes need to be the same (but in this simple case they are all varchars)
#     my_shit <- dplyr::tribble(
#       ~id, ~name, ~type, ~date,
#       1, "phac", "intro", Sys.Date(),
#       2, "wales", "intro", Sys.Date() -1
#     )
#
#     ## run function to push data to sql (defaults defined in function)
#     ## only need to define what table to push to
#     pushdat_function(x = my_shit,
#                      table = "alex_test")
#
#     ## return message in the ui to say how many rows pushed
#     ## (this is bullshit needs to be done proper with error handling in fn etc)
#     output$message_output <- renderText({
#       paste0("Added ", nrow(my_shit), " rows")


        user = Sys.getenv("db_user")



        output$message_output <- renderText({
          paste0(user)
    })
  })
}
