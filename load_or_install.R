# Package Call / Install function:
# given a vector of packages (as strings), this function first checks if a package is installed
# if it is then it is only called otherwise its installed and then called
get.package <- function(packages){
  for( i in 1:length(packages)){
  if(!require(packages[i], character.only = T)){
    install.packages(packages[i])
    }
    library(packages[i], character.only = T)
  }
}
#
get.package()

