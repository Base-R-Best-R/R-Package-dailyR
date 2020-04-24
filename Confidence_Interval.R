# KI
# rm(list = ls())
# Function that takes an atomic vector or single element list as input and calculates a 
# confidence interval

## Description ##

# x ... a data vector 

# fun ... function of interested, example would be the mean but this can also be a custom 
# function - DEFAULT: mean(x)

# a ... nominal coverage probability - DEFAULT: 95%

# size ... amount of samples drawn - DEFAULT: 25000

# na.rm ... optionally omitts NA's from the supplied vector

# "..." ... additional arguments for the funtion, example at the end

##########################################################################################

ki_Boot <- function(x, FUN = mean, a = 0.95, size = 25000, na.rm = F, ...){
    # remove NA's if specified
    if(na.rm == T){
     x <- x[!is.na(x)]
     }
  # length and result from FUN applied to x
  n <- length(x)
  z <- FUN(x, ...)
  # Error 
    if(length(z) != 1){
      stop("Error: Function returns object of length != 1, where 1 was expected")
    } 
  # Sample
  boot <- matrix(sample(x, n * size, replace = T),
                 ncol = size, nrow = n)
  # Columnwise fun
  funs <- apply(boot, 2, FUN)
  # Differences
  dif <- funs - z
  # alpha
  al <- (1 - a) / 2
  # Interval
  I <- c(z + quantile(dif, al),
         z + quantile(dif, (1-al)))
  # Names
  names(I) <- c("Lower", "Upper")
  return(I)
}

## Examples ##

x <- rnorm(1000)

# 95% KI for the mean of x:
ki_Boot(x)

# Lower       Upper 
# -0.07098933  0.05252132 

# 95% KI for the variance of x:

ki_Boot(x, var)

# Lower     Upper 
# 0.9068061 1.0946311 

# 95% KI for the mean of y which includes missing values, additionally supplying arguments 
# to the function via ...

y <- sample(c(NA, 1, 2, 3), 1000, replace = T)

ki_Boot(y, mean, trim = 0.5) # where trim = 0.5 is an additional argument forwarded to 
# mean(x, ...) 

# Lower    Upper 
# 1.973753 2.089239

# 95% KI for an arbitrary custom function:

ki_Boot(x, function(x) mean(x) * var(x), 0.99, 10000)

# Lower       Upper 
# -0.09180669  0.07200868 




