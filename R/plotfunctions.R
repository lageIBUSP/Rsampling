
pairs.plot <- function(p1, p2, destaque=TRUE, cor.dif=c("black","grey"), groups.names=c(1,2), ...){
  dots <- list(...)
  if(!"pch"%in%names(dots)) dots$pch=19
  if(!"xlim"%in%names(dots)) dots$xlim=c(0.8,2.2)
  grupo <- rep(groups.names,each=length(p1))
  if(destaque){
    diferencas <- p1-p2
    do.call(stripchart, c(list(x=as.formula("c(p1[diferencas>0],p2[diferencas>0])~rep(groups.names,each=length(p1[diferencas>0]))"),
                               vertical =TRUE,col=cor.dif[1], ylim=range(c(p1,p2))),dots))
    do.call(stripchart, list(x=as.formula("c(p1[diferencas<=0],p2[diferencas<=0])~rep(groups.names,each=length(p1[diferencas<=0]))"),
                               vertical =TRUE,col=cor.dif[2], pch=dots$pch, add=TRUE))
    segments(x0=1,y0=p1[diferencas>0],x1=2,y1=p2[diferencas>0],col=cor.dif[1])
    segments(x0=1,y0=p1[diferencas<=0],x1=2,y1=p2[diferencas<=0], col=cor.dif[2])
  }
  else{
    do.call(stripchart, c(list(x=as.formula("c(p1,p2)~grupo"), vertical =TRUE),dots))
    segments(x0=1,y0=p1,x1=2,y1=p2)
  }
}

