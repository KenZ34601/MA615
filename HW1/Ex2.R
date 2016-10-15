#1
#a
A = matrix(c(1, 5, -2, 1, 2, -1, 3, 6, -3), nrow = 3, ncol = 3)
# require expm package
A %^% 3
#b
A[,3] <- A[,2]+A[,3]

#2
colVec <- rep.int(10,15)
B <- rbind(colVec, -colVec, colVec)
B%*%t(B)
#3
z<-rbind(rep.int(0,6),diag(x = 1, 5, 6))
t(z)+z

#4
outer_vec <- 0:4
outer(outer_vec, outer_vec, "+")

#5
#a
outer(0:4, 0:4,"+")%%5
#b
outer(0:9, 0:9,"+")%%10
#c
outer(0:8, 9:1,"+")%%9


#6
C <- matrix(seq(1,5, by=1), 5, 5)
D <- t(C)
A <- abs(C-D)+diag(x=1, 5, 5)
b <- c(7, -1, -3, 5, 17)
solve(A, b)

#7
set.seed(75)
aMat <- matrix( sample(10, size=60, replace=T), nr=6)
#a
g4plus<-aMat > 4
length(which(g4plus))
#b
rownames(aMat) <- paste("ROW", 1:6, sep = "_")
indexMat<-which(aMat == 7, arr.ind = TRUE)
counts<-table(indexMat[,1])
which(counts==2)[1]
#c
sigmaMat <- colSums(aMat)
which( outer(sigmaMat,sigmaMat,"+")>75, arr.ind=T )
#8
#a
#sum <- 0
#for(j in 1:5){
#  for(i in 1:20){
#    sum <- sum + i^4 / (j + 3)
#  }
#}
sum(outer((1:20)^4, (1:5) + 3, "/"))
#b
#sum <- 0
#for(j in 1:5){
#  for(i in 1:20){
#    sum <- sum + i^4 / (i*j + 3)
#  }
#}
sum((1:20)^4 / (3 + outer(1:20, 1:5)))

#c
#sum <- 0
#for(i in 1:20){
#  for(j in 1:i){
#    sum <- sum + i^4 / (i*j + 3)
#  }
#}
sum( outer(1:10,1:10,function(i,j){ (i>=j)*i^4/(3+i*j) }) )
