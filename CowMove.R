library(geosphere)
library(ggplot2)
cattlepos <- data.frame(matrix(ncol=3, nrow=10))

colnames(cattlepos) <- c("ID", "x", "y")

cattlepos$ID <- c(1:10)



cattlepos$x <- floor(runif(10, 40, 60))
cattlepos$y <- floor(runif(10, 40, 60))


cenx <- floor(sum(cattlepos$x)/length(cattlepos$x))

ceny <- floor(sum(cattlepos$y)/length(cattlepos$y))


cattlepos$diffx <- cattlepos$x-cenx
cattlepos$diffy <- cattlepos$y-ceny

cattlepos$angle <- atan(cattlepos$diffy/cattlepos$diffx)

cattlepos$angle2 <- 2*pi - ((cattlepos$angle^2)^0.5)


plot(cattlepos$x, cattlepos$y)

ggplot(cattlepos, aes(x,y)) + geom_point() + geom_text(aes(label=ID), vjust =2) +
  geom_point(aes(x=cenx, y=ceny), colour="blue", size = 10)
