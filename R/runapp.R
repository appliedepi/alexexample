#' A basic function to run a shiny app from a package
#'
#' @param app name of the app you want to run
#' @param pkg name of the package that app is in
#' @param launch.browser shiny::runApp argument wether to launch browser (defualt = 0)
#' @param port shiny::runApp argument to expose port (default 3838)
#' @param host shiny::runApp argument to define which host
#' @references this seems to be the proper way to run an app from a package
#' read further from Dean Atali https://stackoverflow.com/questions/37830819/developing-shiny-app-as-a-package-and-deploying-it-to-shiny-server
#'
#' @importFrom shiny runApp
#' @export

launchapp <- function(app, pkg, launch.browser = 0, port = 3838, host = "0.0.0.0") {
  appDir <- system.file(app, package = pkg)
  if (appDir == "") {
    stop("Could not find myapp. Try re-installing `mypackage`.", call. = FALSE)
  }

  shiny::runApp(appDir,
      launch.browser = launch.browser,
      port = port, 
      host = host,
      display.mode = "normal")
}
