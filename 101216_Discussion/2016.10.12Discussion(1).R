# Writing data, in txt, csv or Excel file formats, 
# is the best solution if you want to open these files 
# with other analysis software, such as Excel. However 
# this solution doesn’t preserve data structures, such 
# as column data types (numeric, character or factor). In
# order to do that, the data should be written out in R 
# data format.

# 1) save a single R object
# 2) save multiple R objects
# 3) save entire workspace in a specified file.

x <- rep(c(1,1,3,4,5),10000)
y <- rep(c('a','b','c','d','e'),10000)
z <- rep(c(as.Date("2016-08-01"),as.Date("2016-09-01"),
           as.Date("2016-10-01"),as.Date("2016-11-01"),
           as.Date("2016-12-01")),10000)
df <- data.frame(x=x,y=y,z=z)
p <- hist(x)


# save one object to a file (saveRDS, readRDS)

write.csv(df,'xyz.csv')
saveRDS(df, file="xyz.rds")
saveRDS(df, file="xyz.rda")

saveRDS(x,'x.rds') # Rds stores a single r object
saveRDS(x,'x.rda') # Rda, short name for RData


# clear your work space
rm(list=ls())

# read data
df <- read.csv('xyz.csv')
df1 <- readRDS("xyz.rds")
df2 <- readRDS("xyz.rda")
x1 <- readRDS("x.rds")
x2 <- readRDS("x.rda")
x <- rep(c(1,1,3,4,5),10000)
y <- rep(c('a','b','c','d','e'),10000)
z <- rep(c(as.Date("2016-08-01"),as.Date("2016-09-01"),
           as.Date("2016-10-01"),as.Date("2016-11-01"),
           as.Date("2016-12-01")),10000)
p <- hist(x)


# save multiple objects (save, load)

save(df, x, y, p, file="xyz.Rdata")
rm(list=ls())
load("xyz.Rdata")


# save entire workspace (save.image, load)

save.image()
rm(list=ls())
load('.RData')

save.image('myworkspace.RData')
rm(list=ls())
load('myworkspace.RData')

