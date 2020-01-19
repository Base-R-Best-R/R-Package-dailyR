# Package Call / Install function:
# given a vector of packages (as strings), this function first checks if a package is installed
# if it is, it is only called otherwise its installed and then called
# duplicate functions across packages are returned as a warning message
get.package <- function(packages){
 suppressWarnings({
  lst <- list()
  lst[[1]] <- ls(package:base)
   for( i in seq.int(length(packages))){
    if(!require(packages[i], character.only = T)){
     install.packages(packages[i])
     }
     library(packages[i], character.only = T)
     lst[[i + 1]] <- eval(parse(text = paste0("ls(package:", packages[i], ")")))
   }
   s <- unlist(lst)})
   if(length(s[duplicated(s)]) > 0){
    warning(c("The following functions exist in multiple packages: \n", 
                   paste(" ",s[duplicated(s)], "\n")))
   }
}
#
get.package()
