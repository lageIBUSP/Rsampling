#' Spaghetti plot
#'
#' Quick plot of paired differences, for exploratory purposes.
#' @param {p1, p2} vectors of paired values (numerical vectors)
#' @param highlight should positive and negative differences within pairs highlighted with different colors? Logical
#' @param col.dif color vector if \code{highlight = TRUE}
#' @param groups.names labels for the groups names; numeric or character vector of length two.
#' @param ... further arguments to be passed to \code{plot} function.
#' (e.g., \code{cols}, \code{replace}, \code{stratum}).
#' @export
splot <- function(p1, p2, highlight = TRUE, col.dif = c("black","grey"), groups.names=c(1,2), ...){
  dots <- list(...)
  if(!"pch"%in%names(dots)) dots$pch=19
  if(!"xlim"%in%names(dots)) dots$xlim=c(0.8,2.2)
  grupo <- rep(groups.names,each=length(p1))
  if(highlight){
    diferencas <- p1-p2
    do.call(stripchart, c(list(x=as.formula("c(p1[diferencas>0],p2[diferencas>0])~rep(groups.names,each=length(p1[diferencas>0]))"),
                               vertical =TRUE,col=col.dif[1], ylim=range(c(p1,p2))),dots))
    do.call(stripchart, list(x=as.formula("c(p1[diferencas<=0],p2[diferencas<=0])~rep(groups.names,each=length(p1[diferencas<=0]))"),
                               vertical =TRUE,col=col.dif[2], pch=dots$pch, add=TRUE))
    segments(x0=1,y0=p1[diferencas>0],x1=2,y1=p2[diferencas>0],col=col.dif[1])
    segments(x0=1,y0=p1[diferencas<=0],x1=2,y1=p2[diferencas<=0], col=col.dif[2])
  }
  else{
    do.call(stripchart, c(list(x=as.formula("c(p1,p2)~grupo"), vertical =TRUE),dots))
    segments(x0=1,y0=p1,x1=2,y1=p2)
  }
}

