# Basic Rock Paper Scissors game.
# Enter your choice as a string with the first letter capitalized.
# Note that should you enter your choice written incorrectly or without the first letter capitalized
# you will always lose. 
RPS <- function(choice){
  #sample Pc choice
  NPC <- sample(c("Rock", "Paper", "Scissors"), size = 1)
  # draw as unique event
  if(choice == NPC){
    list("Did I win?" = "Draw", "Opponent" = paste("Your opponent chose", NPC))
    }
  # All combinations that result in a win
  else if(choice == "Rock" & NPC == "Scissors" | choice == "Paper" & NPC == "Rock" | choice == "Scissors" &
          NPC == "Paper"){
    list("Did I win?" = "You won", "Opponent" = paste("Your opponent chose", NPC))
  }
  #remaining combinations 
  else{
    list("Did I win?" = "You lost", "Opponent" = paste("Your opponent chose", NPC))
  }
}
RPS("Rock")

