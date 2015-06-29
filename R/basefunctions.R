#' Shuffling and resampling functions
#'
#' Functions to run (un)restricted sampling with or without replacement in a dataframe.
#'
#' @param dataframe a dataframe with the data to be suffled or resampled.
#' @param cols columns of dataframe that should be selected to be resampled/shuffled. Defaults for all columns.
#' @param replace (logical) should the data be permuted (FALSE) or resmpled with replacement (TRUE) ?
#' @param stratum factor or integer vector that separates data in groups or strata. Randomizations will be performed within each level of the stratum. Needs at least two observations in each level. Default is a single-level stratum.
#' 
#' @section Details:
#' 
#' Each function performs as close as possible the corresponding options in Resampling Stats add-in for Excell
#' (www.resample.com) for permutation (shuffling) and sampling with replacement (resampling)
#' values in tabular data:
#' \itemize{
#'   \item \code{normal_rand} corresponds to the 'normal shuffle' and 'normal resample' option.
#' For shuffling (\code{replace=FALSE}) the data is permuted over all cells of \code{dataframe}.
#' For resampling (\code{replace=FALSE}) data from any cell can be sampled and attributed to any other cell.
#' \item \code{within_rows} and \code{within_columns} correspond to the options with the same names.
#' The randomization is done within each row or column of \code{dataframe}.
#' So for shuffling the values of each line/column are permuted independently and for
#' resampling the values are sampled independently from each line/column and attributed only
#' to cells of the line/column they were sampled.
#' \item \code{rows_as_units} and \code{columns_as_units} also correspond to the options with the same names.
#' Each row or column \code{dataframe} is shuffled or resampled as whole.
#' Only the placement of rows and columns in the dataframe change. The position of values in each line/column remains the same. 
#' }
#' All functions assemble the randomized values in a dataframe
#' of the same configuration of the original. Columns that
#' were not selected to be randomized with argument \code{cols} are then
#' bind to the resulting dataframe.
#'
#'
#' @return a dataframe with the same structure of those input in \code{dataframe} with values randomized accordingly.
#' 
#' @section References:
#' 
#' Statistics.com LCC. 2009. Resampling Stats Add-in for Excel User’s Guide.
#' \url{http://www.resample.com/content/software/excel/userguide/RSXLHelp.pdf}

#' @name basefunctions
NULL

#' @rdname basefunctions
within_rows <- function(dataframe, cols=1:ncol(dataframe), replace=FALSE){
    if(class(dataframe)!="data.frame") stop ("the 1st argument is not of class 'data.frame'")
    cbind(rn=1:nrow(dataframe), dataframe[cols]) %>%
        as.data.frame() %>%
            gather(key="variable", value="value", -rn) %>%
                group_by(rn) %>%
                    mutate(value=sample(value, size=n() , replace)) %>%
                        ungroup() %>%
                            spread(variable, value) %>%
                                select(-rn) %>%
                                    {if(length(cols)<ncol(dataframe)) cbind(., dataframe[-cols])[,colnames(dataframe)] else .} %>%
                                        as.data.frame()
}

#' @rdname basefunctions
within_columns <- function(dataframe, cols=1:ncol(dataframe), stratum=rep(1,nrow(dataframe)), replace = FALSE){
    if(class(dataframe)!="data.frame") stop ("the 1st argument is not of class 'data.frame'")
    cbind(rn=1:nrow(dataframe), stratum=stratum,dataframe[cols]) %>%
                as.data.frame() %>%
                    gather("variable", "value", -rn , -stratum) %>%
                        group_by(stratum,variable) %>%
                            mutate(value=sample(value, size=n() , replace)) %>%
                                ungroup() %>%
                                    spread(variable, value) %>%
                                        select(-rn) %>%
                                            {if(length(cols)<ncol(dataframe)) cbind(., dataframe[-cols])[colnames(dataframe)] else .} %>%
                                                as.data.frame()
}

#' @rdname basefunctions
normal_rand <- function(dataframe, cols=1:ncol(dataframe), stratum=rep(1,nrow(dataframe)), replace = FALSE){
    if(class(dataframe)!="data.frame") stop ("the 1st argument is not of class 'data.frame'")
    cbind(rn=1:nrow(dataframe), stratum=stratum, dataframe[cols]) %>%
        as.data.frame()%>%
            gather("variable", "value", -rn , -stratum) %>%
                group_by(stratum) %>%
                    mutate(value=sample(value, size=n() , replace)) %>%
                        ungroup() %>%
                            spread(variable, value) %>%
                                select(-rn) %>%
                                    {if(length(cols)<ncol(dataframe)) cbind(., dataframe[-cols])[colnames(dataframe)] else .} %>%
                                        as.data.frame()
}

#' @rdname basefunctions
rows_as_units <- function(dataframe, stratum=rep(1,nrow(dataframe)), replace = FALSE){
    if(class(dataframe)!="data.frame") stop ("the 1st argument is not of class 'data.frame'")
    cbind(ri=1:nrow(dataframe), dataframe) %>%
        as.data.frame() %>%
            normal_rand(function(x)x, cols=1, stratum=stratum, replace) %>%
                arrange(ri) %>%
                    select(-ri) %>%
                        as.data.frame()
}

#' @rdname basefunctions
columns_as_units <- function(dataframe, cols=1:ncol(dataframe), replace = FALSE){
    if(class(dataframe)!="data.frame") stop ("the 1st argument is not of class 'data.frame'")
    dataframe[,sample(cols, size=length(cols), replace)] %>%
        {if(length(cols)<ncol(dataframe)) cbind(dataframe[-cols],.) else .} %>%
            as.data.frame()
    
}
