#' Zero-fixed (re)sampling
#'
#' This function builds on \code{\link[base]{sample}} to provide sampling from a vector, but with all 
#' zero entries fixed. This way, \code{zfsample(c(0,1,0,2))} may result in (0,1,0,2) or (0,2,0,1), but the 
#' positions that were initially zero will remain zeroed.
#' @param x Either a vector of one or more elements from which to choose, or a positive integer.
#' @param replace Should sampling be with replacement?
#' 
#' @return a vector of the same length of 'x' with elements drawn from 'x'. 
#' @section Details:
#' The actual sampling is done by \code{\link[base]{sample}}, so its help page should be checked
#' for details on the parameter handling. The parameter 'size' is always passed as \code{length(x)},
#' and 'prob' is not supported.
#' @examples 
#' # Sampling without replacement
#' zfsample(c(0,1,2,0,3,4,0))
#' # Sampling with replacement
#' zfsample(c(0,1,2,0,3,4,0), replace=TRUE)
#' # With no zeroes, zfsample just calls sample
#' set.seed(42); s1<-sample(c(1,2,3,4,5,6))
#' set.seed(42); s2<-zfsample(c(1,2,3,4,5,6))
#' all.equal(s1, s2)

#' @export
zfsample <- function(x, replace=FALSE) {
  if(sum(x == 0) == 0) return(sample(x, replace=replace)) # no zeroes in x
  zeroes <- which(x == 0)
  if(length(x[-zeroes]) < 2) return(x) # either no non-zero, or just one non-zero
  x[-zeroes] <- sample(x[-zeroes], replace=replace)
  return(x)
}
