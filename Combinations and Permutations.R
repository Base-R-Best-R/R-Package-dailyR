# The following functions allow for quick permutation and combination calculations.#
#  Binomial coefficient
binc <- function(n, k){
  return(factorial(n) / (factorial(n-k) * factorial(k)))
}
# comb / perm function
# where rep = T represents whether elements are replaced or not and perm = T displays that the permutation 
#is of importance.
comb_solv <- function(n, k, rep = T, perm = T){
  if(rep == T & perm == T){
    return(n^k)
  } 
  else if(rep == F & perm == T){
    return(factorial(n) / factorial(n - k))
  }
  else if(rep == T & perm == F){
    return(binc((n + k - 1), k))
  }
  else{
    return(binc(n, k))
  }
}
