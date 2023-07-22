#' A basic function to run a shiny app from a package
#'
#' @param app name of the app you want to run
#' @param pkg name of the package that app is in
#' @references this seems to be the proper way to run an app from a package
#' read further from Dean Atali https://stackoverflow.com/questions/37830819/developing-shiny-app-as-a-package-and-deploying-it-to-shiny-server
#'
#' @importFrom shiny runApp
#' @export

launchapp <- function(app, pkg) {
  appDir <- system.file(app, package = pkg)
  if (appDir == "") {
    stop("Could not find myapp. Try re-installing `mypackage`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
