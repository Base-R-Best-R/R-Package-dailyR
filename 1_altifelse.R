#Alternative ifelse that is about ~ 10 times faster than the regular base R ifelse()
# The origin of this subsetting idea is this SO thread:
# https://stackoverflow.com/questions/15016723/how-to-add-column-into-a-dataframe-based-on-condition
altifelse <- function(test, yes, no){
  c(no, yes)[(test) + 1]
}
# Benchmark
library(rbenchmark)
#
df <- data.frame(x = sample(c(1,2,3,4,5), size = 1000000, replace = T), 
                 y = c(1:100000))
y <- benchmark(
  ifelse(df$x >= 5, "Up", "Down")
)
paste("runtime:", y[1,3], "seconds.")
#
x <- benchmark(
  altifelse(df$x >= 5, "Up", "Down")
)
paste("runtime:", x[1,3], "seconds.")
#
y[1,3] / x[1,3] #10.61 times faster.
#


