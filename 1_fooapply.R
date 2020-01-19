# fooapply allows one to apply different simple functions to a vector.
# Functions to apply have to be simple enough to only need the specification of a vector.
# The desired functions have to be fed into the function as a string and typos will lead to an error.
fooapply <- function(x, functions = c("mean", "median", "sd", "IQR", "quantile"), na.rm = T){
  func <- functions
  lis <- list()
  for(i in seq.int(length(func))){
    if(na.rm == T){
      eval(parse(text = paste0("lis[[", i,"]]", "<-", func[i], "(x, na.rm = T)")))
    } 
    else{
      eval(parse(text = paste0("lis[[", i,"]]", "<-", func[i], "(x)")))
    }
  }
  names(lis) <- functions
  return(lis)
}
fooapply(c(1,2,3,4))

