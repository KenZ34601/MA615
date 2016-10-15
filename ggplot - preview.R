# ggplot2

# http://docs.ggplot2.org/current/
# http://www.cookbook-r.com/Graphs/
# 
head(Orange)
Orange


library(ggplot2)
library(ggthemes)

ggplot(Orange, aes(x=circumference, y=age)) + geom_point() + geom_smooth(method = lm)

model <- lm(formula = age ~ circumference, data = Orange)

p1<-ggplot(model, aes(.fitted, .resid))+geom_point()

p1<-p1+stat_smooth(method="loess")+geom_hline(yintercept=0, 
                                              col="red", linetype="dashed")
p1<-p1+xlab("Fitted values")+ylab("Residuals")
p1<-p1+ggtitle("Residual vs Fitted Plot")+theme_wsj()

p1

p2<-ggplot(model, aes(qqnorm(.stdresid)[[1]], .stdresid))+geom_point(na.rm = TRUE)

# p2<-p2+geom_abline(aes(qqline(.stdresid)))+
#   xlab("Theoretical Quantiles")+
#   ylab("Standardized Residuals")
# 
# p2<-p2+ggtitle("Normal Q-Q")+theme_wsj()

p2



