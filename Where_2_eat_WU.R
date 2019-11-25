# Where 2 eat function 
# Scrapes Lunch menus of 2 WU campus restaurants the Mensa and Library Cafe.
# Running the function will install packages required and call then return the menus of the current day
# note that weekends will yield a few empy strings and Null since there are no lunch menus on weekends
########################################################################################################
where.2.eat <- function(){
  #Supreess warning messages such as package loaded etc. 
  suppressWarnings({
  #to make sure every needed package is installed and loaded
  get.package <- function(packages){
    for( i in 1:length(packages)){
      if(!require(packages[i], character.only = T)){
        install.packages(packages[i])
      }
      library(packages[i], character.only = T)
    }
  }
  get.package(c("dplyr", "rvest", "lubridate"))
  # website containing lunch menu
  library <- html("https://www.library-cafe.at/tagesmenue-wien/")
  # scrape text of specific html node
  library.text <- library %>%
    html_nodes("span") %>%
    html_text()
  # filter for weekdays
  library.tag <- library.text[which(substr(library.text, 1, 6) %in% c("Montag", "Dienst", "Mittwo","Donner", "Freita"))]
  # remove repeated information
  library.tag.ex <- library.tag[seq.int(1, length(library.tag), 3)]
  names(library.tag.ex) <- c("Montag", "Dienst", "Mittwo","Donner", "Freita")
  # find index of current day
  l <- which(substring(weekdays(Sys.Date()), first =  1, last = 6) == names(library.tag.ex))
  ##Mensa##
  mensa <- html("http://www.wumensa.at/")
  # filter for specific html node text
  mensa.text <- mensa %>%
    html_nodes(".text_umal") %>%
    html_text()
  # remove information thats not of interest
  mensa.text.ex <- mensa.text[c(1, 2, 4, 5, 13)]
  # Convert to list and strsplit according to newlines
  j <- list()
  for(i in 1:length(mensa.text.ex)){
    j[[i]] <- strsplit(mensa.text.ex[i], "\n")
  }
  j[[3]] <- c(j[[3]], j[[4]])
  j <- j[c(1, 2, 3, 5)]
  #names
  names(j) <- c("Eco 1", "Eco 2", "Pizza", "Global")
  ##return##
  return(list( "Mensa" = j, "Library" = strsplit(library.tag.ex[l], "\n")))})
}
#
where.2.eat()

