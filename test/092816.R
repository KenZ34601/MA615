data = read.csv(file = "COR.csv")
processed <- data
length(processed$Zip.Code[processed$Zip.Code==NA])
m <-matrix(c(1:10, 11:20), nrow = 10, ncol =2)


myList<- list(A<-matrix(1:12,4), b=c(20,3,7), C = matrix(7,5,10))
myList %*% lapply(sum) %*% sum()

for(i in 1:24){
  p[j]<-c(2,3,pi,4)
  for(j in 1:4){
    sum <- sum + cos(i*pi*p[j])
  }
}

i<-1:24
j<-c(2,3,pi,4)
c<-outer(1:24,j,"*")
m<-cos(c*pi)
sum(m)
