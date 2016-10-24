stpr <- function(n){
  for(i in 1:n+100){
    print(i)
    if(i>n) {
      stop("that's enough i's for you")
    }
    
  }
  
}


stpr(4)