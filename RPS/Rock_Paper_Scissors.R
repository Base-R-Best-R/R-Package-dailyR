# Basic Rock Paper Scissors game.
# Enter your choice as a string.
RPS <- function(choice){
  choice <- tolower(choice)
  if(!choice %in% c("rock", "paper", "scissors")){
    stop("Error: Your choice does not match either rock, paper or scissors.")
  }
  #sample Pc choice
  NPC <- sample(c("rock", "paper", "scissors"), size = 1)
  # draw as unique event
  if(choice == NPC){
    list("Did I win?" = "Draw", "Opponent" = paste("Your opponent chose", NPC))
    }
  # All combinations that result in a win
  else if(choice == "rock" & NPC == "scissors" | choice == "paper" & NPC == "rock" | choice == "scissors" &
          NPC == "paper"){
    list("Did I win?" = "You won", "Opponent" = paste("Your opponent chose", NPC))
  }
  # All remaining combinations result in a loss
  else{
    list("Did I win?" = "You lost", "Opponent" = paste("Your opponent chose", NPC))
  }
}

#Example
RPS("Paper")
#$`Did I win?`
#[1] "Draw"

#$Opponent
#[1] "Your opponent chose paper"
##########
RPS("pApeR")[[1]]
#"You lost"