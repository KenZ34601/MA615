#install.packages("ggvis")
library(ggvis)

# basic
p <- ggvis(mtcars, x = ~wt, y = ~mpg) # specifying dataset and variables you want to plot
layer_points(p) # telling ggvis how to plot the data by using the layer
layer_points(ggvis(mtcars, x = ~wt, y = ~mpg))

# using pipe to reproduce the plot
mtcars %>% ggvis(x = ~wt, y = ~mpg) %>% layer_points()
mtcars %>% ggvis(x = ~wt, y = ~mpg) %>% layer_lines()



# associate ggvis with dplyr
library(dplyr)
mtcars %>% filter(gear > 3.5) %>% ggvis(x = ~wt, y = ~mpg) %>% layer_points() %>% layer_smooths()

# 
mtcars %>% ggvis(x=~wt, y=~mpg, stroke=~gear) %>% layer_points()
mtcars %>% ggvis(x=~wt, y=~mpg, size=~gear) %>% layer_points()
mtcars %>% ggvis(x=~wt, y=~mpg, size=~gear, fill=~am) %>% layer_points()
mtcars %>% ggvis(x=~wt, y=~mpg, size=~gear, fill=~factor(cyl), shape=~factor(am)) %>% layer_points()
mtcars %>% ggvis(x=~wt, y=~mpg, size=~gear, fill:='red', shape=~factor(cyl)) %>% layer_points()
mtcars %>% ggvis(x=~wt, y=~mpg, size=~gear, fill:='red', shape=~factor(cyl)) %>% layer_points()
mtcars %>% ggvis(x=~wt, y=~mpg, size=~gear, fill:='red', opacity:='0.4') %>% layer_points()

### interaction
mtcars %>% 
  ggvis(~wt, ~mpg, size := input_slider(10, 100), opacity := input_slider(0, 1)) %>% 
  layer_points()

# histogram
mtcars %>% ggvis(~wt) %>% layer_histograms(width = 2)
mtcars %>% ggvis(~wt) %>% layer_histograms(width = input_slider(0.1,3,step=0.05))

mtcars %>% ggvis(x=~wt, y=input_select(c('mpg','am','gear'), map=as.name)) %>% layer_points()

mtcars %>% 
  ggvis(x=input_select(colnames(mtcars),map=as.name,label='x'), 
        y=input_select(colnames(mtcars), map=as.name, label='y'),
        size=input_select(colnames(mtcars),map=as.name, label='size'),
        fill=input_select(colnames(mtcars),map=as.name, label='fill')) %>% 
  layer_points() %>%
  add_axis("x", title='x axis') %>%
  add_axis("y", title='y axis')


### layers
mtcars %>% ggvis(x = ~wt, y = ~mpg) %>% layer_lines()
mtcars %>% ggvis(x = ~wt, y = ~mpg) %>% layer_paths()
mtcars %>% ggvis(x = ~factor(cyl), y = ~mpg) %>% layer_boxplots()
# the same as
layer_boxplots(ggvis(mtcars,x=~factor(cyl), y=~mpg))

# path and circle
set.seed(100)
df <- data.frame(x = 1:10, y = runif(10), y2 = runif(10))
df %>% ggvis(~x, ~y) %>% layer_paths(    fill:="red")
df %>% ggvis(~x, ~y, y2=~y2) %>% layer_ribbons(fill:="green")

t <- seq(0, 2 * pi, length = 100)
df <- data.frame(x = sin(t), y = cos(t))
df %>% ggvis(~x, ~y) %>% layer_paths(fill := "red")

# text
df <- data.frame(x = c(1:3),y = c(2,4,3),z = as.character(c("x","y","z")))
df %>% ggvis(~x, ~y, text:=~z) %>% layer_text(fontSize=~y, angle:=45)

#Library
#install.packages("leaflet")
library(leaflet)
# Background 1: NASA
m=leaflet() %>% addTiles() %>% 
  setView( lng = 2.34, lat = 48.85, zoom = 5 ) %>% 
  addProviderTiles("NASAGIBS.ViirsEarthAtNight2012")
m

# Background 2: World Imagery
m=leaflet() %>% addTiles() %>% 
  setView( lng = 2.34, lat = 48.85, zoom = 3 ) %>% 
  addProviderTiles("Esri.WorldImagery")
m

