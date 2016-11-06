#chatterjee-Price Attitude Data
library(datasets)

summary(attitude)

dat <-  attitude[, c(3,4)]

plot(dat, main = "% favorable responses to learning and privilege", pch=20,cex=2)

# partition a set into clusters
# minimize within cluster variation
# K-means requires continuous RVs

set.seed(5)

km1 <- kmeans(dat, 2, nstart=100)


plot(dat, col=(km1$cluster+1), main ="K-means result with 2 clusters", pch=20,cex=2)


# check for optimal number of clustrewrs

mydata <- dat
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for(i in 2:15) wss[i] <- sum(kmeans(mydata, centers=i)$withinss)
#every time it goes in the loop, it will try to sum the squares of distance
#between the center and the datapoints in "mydata"

plot(1:15, wss, type="b", xlab="Number of Clusers",
     ylab="Within groups sum of squares",
     main="Qssessing the Optimal number of Clusers with the Elbow Method",
     pch=20, cex=2)
# maybe 6?

# now use K-Means with optimal number of clusters

set.seed(7)

km2 = kmeans(dat, 6, nstart=100)

km2

# plot the results

plot(dat, col=(km2$cluster+1), main="K-means - 6 clusters", pch=20, cex=2)
