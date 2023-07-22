#' A basic function that pushes a dataset to the mysql database
#'
#' @param x a dataframe to push
#' @param user account username to login to sql server
#' @param pass account password to login to sql server
#' @param dbname name of the database to login to sql server
#' @param host address of the sql server
#' @param table sql table to write to
#'
#' @importFrom DBI dbConnect dbAppendTable
#' @importFrom RMariaDB MariaDB
#'
#' @return a vector with the number of rows pushed
#' @export

pushdat_function <- function(x,
                             user = Sys.getenv("db_user"),
                             pass = Sys.getenv("db_pwd"),
                             dbname = Sys.getenv("db_name"),
                             host = Sys.getenv("db_host"),
                             table
                             ) {
  # connect to your sql database
  sqldtbase <- DBI::dbConnect(RMariaDB::MariaDB(),
                              ## one of the below options will feed from docker secrets
                              user = user,
                              password = pass,
                              dbname = dbname,
                              ## note that the port is not necessary
                              host = host)

  ## add rows on to the existing table
  DBI::dbAppendTable(sqldtbase, table, x)

  ## TODO build in here an error catch so that we actually know how many rows pushed (and then put that in the message)

}
