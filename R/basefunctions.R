#' Shuffling and resampling functions
#'
#' Functions to run (un)restricted sampling with or without replacement in a dataframe.
#'
#' @param dataframe a dataframe with the data to be shuffled or resampled.
#' @param cols columns of dataframe that should be selected to be resampled/shuffled. Defaults for all columns.
#' @param replace (logical) should the data be permuted (FALSE) or resampled with replacement (TRUE) ?
#' @param stratum factor or integer vector that separates data in groups or strata. Randomizations will be performed within each level of the stratum. Needs at least two observations in each level. Default is a single-level stratum.
#' @param FUN function used for the sampling procedure. The default is \code{\link[base]{sample}}, and a new
#' function \code{\link{zfsample}} is provided for sampling with fixed zeroes.
#' @param length.out (integer) specifies the size of the resulting dataset. 
#' For columns_as_units, a data.frame with length.out columns will be returned, and for
#' rows_as_units, a data.frame with length.out rows will be returned.
#' Note that if length.out is larger than the relevant dimension, \code{replace} must also be specified.
#'
#' @section Details:
#' 
#' Each function performs as close as possible the corresponding options in Resampling Stats add-in for Excel
#' (www.resample.com) for permutation (shuffling) and sampling with replacement (resampling)
#' values in tabular data:
#' \itemize{
#'   \item \code{normal_rand} corresponds to the 'normal shuffle' and 'normal resample' option.
#' For shuffling (\code{replace=FALSE}) the data is permuted over all cells of \code{dataframe}.
#' For resampling (\code{replace=TRUE}) data from any cell can be sampled and attributed to any other cell.
#' \item \code{within_rows} and \code{within_columns} correspond to the options with the same names.
#' The randomization is done within each row or column of \code{dataframe}.
#' So for shuffling the values of each row/column are permuted independently and for
#' resampling the values are sampled independently from each row/column and attributed only
#' to cells of the row/column they were sampled.
#' \item \code{rows_as_units} and \code{columns_as_units} also correspond to the options with the same names.
#' Each row or column \code{dataframe} is shuffled or resampled as whole.
#' Only the placement of rows and columns in the dataframe change. The position of values in each line/column remains the same. 
#' }
#' All functions assemble the randomized values in a dataframe
#' of the same configuration of the original. Columns that
#' were not selected to be randomized with argument \code{cols} are then
#' bound to the resulting dataframe. The order and names of the rows and columns are preserved, except if \code{length.out}
#' is specified. In this case, the randomized rows/columns may be shifted to the end of the table.
#'
#' When both \code{stratum} and \code{length.out} are used, the function will try to keep the proportion of each strata close to the original.
#'
#' @return a dataframe with the same structure of those input in \code{dataframe} with values randomized accordingly.
#' 
#' @section References:
#' 
#' Statistics.com LCC. 2009. Resampling Stats Add-in for Excel User's Guide.
#' \url{http://www.resample.com/content/software/excel/userguide/RSXLHelp.pdf}

#' @name basefunctions
NULL

# Helper function to calculate a distribution of sampling lengths within stratums, for when both stratum and length.out are specified
rlength <- function (stratum, length.out) {
	ust <- unique(stratum)
	if(is.null(length.out)) return(sapply(ust, function(i) sum(stratum==i)))
	tmp <- length.out * sapply(ust, function(i) sum(stratum==i)) / length(stratum)
	tmp <- round(tmp)
	if (sum(tmp) != length.out) {# one stratum is chosen at random to fix the rounding error
		chosen <- sample(lenght(ust), 1)
		tmp[ chosen ] <- length.out - sum(tmp[-chosen])
	}
    return(tmp)
}

#' @rdname basefunctions
#' @export
within_rows <- function(dataframe, cols=1:ncol(dataframe), replace=FALSE, FUN=base::sample){
    if(class(dataframe)!="data.frame") stop ("the 1st argument is not of class 'data.frame'")
    dataframe[,cols] <- as.data.frame(t(apply(dataframe[,cols], 1, FUN, replace=replace)))
    return(dataframe)   
}

#' @rdname basefunctions
#' @export
within_columns <- function(dataframe, cols=1:ncol(dataframe), stratum=rep(1,nrow(dataframe)), 
                           replace = FALSE, FUN=base::sample){
    if(class(dataframe)!="data.frame") stop ("the 1st argument is not of class 'data.frame'")
    ust=unique(stratum)
    #dfs=dataframe[,cols]
    for(i in ust){
        dataframe[stratum == i, cols]<- apply(dataframe[stratum == i,cols], 2, FUN, replace=replace)
    }
    return(dataframe)   
}

#' @rdname basefunctions
#' @export
normal_rand <- function(dataframe, cols=1:ncol(dataframe), stratum=rep(1,nrow(dataframe)), 
                        replace = FALSE, FUN=base::sample){
    if(class(dataframe)!="data.frame") stop ("the 1st argument is not of class 'data.frame'")
    ust=unique(stratum)
    #dfs=dataframe[,cols]
    for(i in ust){
        dataframe[stratum == i, cols] <- 
          do.call(FUN, list(x=as.matrix(dataframe[stratum == i,cols]), replace=replace))
    }
    return(dataframe)   
}

#' @rdname basefunctions
#' @export
rows_as_units <- function(dataframe, stratum=rep(1,nrow(dataframe)), replace = FALSE, length.out=NULL){
    if(class(dataframe)!="data.frame") stop ("the 1st argument is not of class 'data.frame'")
    ust=unique(stratum)
    rsize <- rlength(stratum, length.out)
    ind=c()
    for(i in ust){
        ind<-c(ind, sample(which(stratum==i), size=rsize[which(ust==i)], replace=replace))
    }
    dataframe[ind,]
}

#' @rdname basefunctions
#' @export
columns_as_units <- function(dataframe, cols=1:ncol(dataframe), replace = FALSE, length.out=NULL){
    if(class(dataframe)!="data.frame") stop ("the 1st argument is not of class 'data.frame'")
    if (missing(length.out))
      dataframe[,cols] <- dataframe[,sample(cols, replace=replace)]
    else
      dataframe <- cbind(dataframe[,-cols], dataframe[,sample(cols, size=length.out, replace=replace)])
    return(dataframe)
}
