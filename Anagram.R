# Function that checks if two strings are an anagram of one another
# The function utilizes the str_count function of the stringr package
# To remove case sensitifity all strings are converted to lower case 
library(stringr)
# Function
ana <- function(x, y){
  if(sum(str_count(tolower(x), letters) == str_count(tolower(y), letters)) == length(letters)){
    "Those two strings are an anagram of one another"
  } 
  else{
    "Those two strings are not an anagaram of one another"
  }
}
# Example
ana("Silent", "Listen")
#[1] "Those two strings are an anagram of one another"
