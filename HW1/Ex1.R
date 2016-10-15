#Exercise 1
#1. Creating vectors
#a
aVec<-c(1:20)
#b
bVec<-sort(aVec, decreasing = TRUE)
#c
cVec<-c(aVec,bVec[-1])
#d
tmp<-c(4,6,3)
#e
eVec<-rep(tmp, times=10)
#f
fVec<-c(rep(tmp, times = 10),4)
#g
gVec<-rep(tmp, times = c(10,20,30))
#2. Creating vectors
#a
x <- seq(3, 6, 0.1)
y <- exp(x)*cos(x)
plot(x,y,col="red", type="l")
points(x,cos(x),col="black")
points(x,exp(x),col="green")

#3
#a
hVec<-(0.1^seq(3, 36, by=3)*0.2^seq(1, 34, by=3))
#b
iVec<-2^seq(1, 25, by=1)/seq(1, 25, by=1)

#4
#a
sigma_a<-sum(seq(10, 100, by=1)^3+4*seq(10,100, by=1)^2)
#b
sigma_b<-sum(2^seq(1, 25, by=1)/seq(1, 25, by=1)+3^seq(1,25, by=1)/seq(1, 25, by=1))

#5
#a
jVec<-paste("label",1:30,sep=" ")
#b
kVec<-paste("fn",1:30,sep="")

#6
set.seed(50)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
plot(xVec, col="red")
points(xVec[xVec>600], col="green")
#a
diffVec <- yVec[-1] - xVec[-1*length(yVec)]
plot(diffVec, col="black")
#b
divVec <- sin(yVec[-1*length(xVec)])/cos(xVec[-1])  
plot(divVec, col="black")
#c
x_new <- xVec[-c(length(xVec)-1, length(xVec))]+2*xVec[-c(1, length(xVec))]-xVec[-c(1,2)]
#d
sigma_d <- sum(-exp(-xVec[-1])/(xVec[-length(xVec)]+10))

#7
#a
plot(yVec, col="blue")
points(yVec[yVec>600], col="yellow")
#b
idx<-which(yVec>600)
#c
which(xVec[idx]>600)
#d
avg<-mean(xVec)
root_x <- sqrt(abs(xVec-avg))
plot(xVec, col="red")
points(root_x, col="green")
#e
which(yVec>max(yVec)-200)
#f
idx_even <- which(xVec%%2 == 0)
length(idx_even)
#g
xVec_new <- xVec[(order(yVec, decreasing = FALSE))]
#h
xVec_sample <- xVec[seq(1,250,by=3)]

#8
#numerator:even starting 2
#denominator: odd starting 3
#odd<-seq(3,39,by=2)
#even<-seq(2,38,by=2)
mVec<-c(1, cumprod(seq(2,38,by=2)/seq(3,39,by=2)))
sum(mVec)
