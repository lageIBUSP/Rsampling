#' Repeats randomizations and scores summary statistics
#'
#' Repeats resampling/shuffling of dataframes and scores the values returned by
#' user-define function which is applied to each randomized dataframe.
#' @inheritParams basefunctions
#' @param type character; the name of the randomization function to be applied to \code{dataframe}.
#' See \link[=basefunctions]{randomization functions}.
#' @param dataframe a dataframe with the data to be shuffled or resampled.
#' @param statistics a function that calculates the statistics of interest from the dataframe.
#' The first argument should be the dataframe with the data and preferably should
#' return a (named) vector, data frame, matrix or array.
#' @param ntrials integer; number of randomizations to perform.
#' @param simplify logical; should the result be simplified
#' to a vector, matrix or higher dimensional array if possible? 
#' @param ... further arguments to be passed to the randomization functions
#' (e.g., \code{cols}, \code{replace}, \code{stratum}).
#' @param progress which kind of progress bar should be used (currently unimplemented!)
#' 
#' @section Details:
#' 
#' This function corresponds to \emph{Repeat and score} in Resampling Stats add-in for Excel
#' (www.resample.com). The randomization function defined by \code{type} is applied \code{ntrials}
#' times on the data provided by \code{dataframe}. At each trial the function defined by argument
#' \code{statistics} is applied to the resulting dataframe and the resulting objects are returned.
#'
#' @return a list of objects returned by the function defined by \code{statistics}
#' or a vector, matrix or array when \code{simplify=TRUE} and simplification can be done
#' (see \code{\link[base]{simplify2array}}).
#' 
#' @section References:
#' 
#' Statistics.com LCC. 2009. Resampling Stats Add-in for Excel User's Guide.
#' \url{http://www.resample.com/content/software/excel/userguide/RSXLHelp.pdf}
#' @export
Rsampling <- function(type=c("normal_rand", "rows_as_units", "columns_as_units", "within_rows", "within_columns"),
                       dataframe, statistics, ntrials=10000, simplify=TRUE, progress="text", ...){
    f1 <- match.fun(match.arg(type))
    dots <- list(...)
    ## get rid of arguments declared in dots not defined for function chosen in 'type'
    dots <- dots[names(dots) %in% names(formals(f1))]
    res <- list()
    for(i in 1:ntrials)
        {
            res[[i]] <- statistics(do.call(f1, c(list(dataframe=dataframe), dots)))
        }
    #rlply(ntrials, statistics(do.call(f1, c(list(dataframe=dataframe), dots))), .progress = progress) %>%
    if(simplify)
        {
          res <- simplify2array(res)
        }
return(res)
}


