# is.integer.divide()
# If the result of the diviion of the element of b / a is integer (not the R object) the value is replaced by the 
# result of the devision.
is.integer.divide <- function(a, b){
  k <- b/a
  i <- which(as.integer(b/a) == b/a)
  b[i] <- k[i]
  b
}
#
is.integer.divide(2, 1:20)
# [1]  1  1  3  2  5  3  7  4  9  5 11  6 13  7 15  8 17  9 19 10
class(is.integer.divide(2, 1:20))
# [1] "numeric"