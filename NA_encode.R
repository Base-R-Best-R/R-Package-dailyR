#na.encode
na.encode <- function(df, x){
  df[df == x] <- NA
  df
}