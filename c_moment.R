#central moment function
c.moment <- function(x, mom = 3){
  a <- mean((x - mean(x))^mom) / var(x)^(mom/2)
  if(mom == 1){
  c("First Moment" = a)  
  }
  else if(mom == 2){
    c("Variance" = a)
  }
  else if(mom == 3){
    c("Skewness" = a)
  }
  else if(mom == 4){
    c("Kurtosis" = a)
  }
  else{
     eval(parse(text = paste("c(","'", mom, "- Central Moment", "'", "=", a, ")")))
  }
}

