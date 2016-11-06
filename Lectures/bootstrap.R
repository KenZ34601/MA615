# median, mean, quartiles, etc
# Bootstrap

### by hand
plot(nerve)
median(nerve)

B <- 10000
Tboot <- rep(0,B)

for (i in 1:B){
  rep = sample(nerve, 799, replace=TRUE)
  Tboot[i] = median(rep)
}

#median
median.T <- mean(Tboot)
median.T
#variance
var(Tboot)
# standard error
se.T <- sqrt(var(Tboot))
se.T
# 
# # Use the boot package
# library(boot) #load the package
# # Now we need the function we would like to estimate
# # In our case the beta:
# betfun = function(data,b,formula){  
#   # b is the random indexes for the bootstrap sample
#   d = data[b,] 
#   return(lm(d[,1]~d[,2], data = d)$coef[2])  
#   # thats for the beta coefficient
# }
# # now you can bootstrap:
# bootbet = boot(data="your data here", statistic=betfun, R=5000)
# # R is how many bootstrap samples
# names(bootbet)
# plot(bootbet)
# hist(bootbet$t, breaks = 100)

library(boot)

funmedian <- function(data, index){
  x = data(index)
  return(median(x))
}

## sam <-sample(799,799,replace = TRUE)

boot(nerve, funmedian, R = 10000)
boot1 <- boot(nerve, funmedian, R = 10000)

boot1ci <- boot.ci(boot1, conf = 0.95, type = "all")

print(boot1)
print(boot1ci)