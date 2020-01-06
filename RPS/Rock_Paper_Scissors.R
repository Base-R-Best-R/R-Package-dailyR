# Basic Rock Paper Scissors game.
# Enter your choice as a string.
#################################################################
setwd("~/GitHub/YTM/Package/Personal-R-Package-to-be-named-/RPS")# The working directory where you put the pictures, rock.jpg, paper.jpg and scissors.jpg
# This function is partly off SO: https://stackoverflow.com/questions/9543343/plot-a-jpg-image-using-base-graphics-in-r
#install.packages("jpeg")
plot_jpeg <- function(path, main, text, subt){
  require("jpeg")
  jpg <- readJPEG(path, native=T) 
  res <- dim(jpg)[2:1] 
    plot(1,1,xlim=c(1,res[1]),ylim=c(1,res[2]),asp=1,type='n',xaxs='i',yaxs='i',xaxt='n',yaxt='n',xlab='',ylab='',bty='n', 
         main = main)
    mtext(subt, side=3)
    rasterImage(jpg,1,1,res[1],res[2])
}
###########################################################################################################################
RPS <- function(choice){
  ###
  plot_jpeg <- function(path, main, text, subt){
    require("jpeg")
    jpg <- readJPEG(path, native=T) 
    res <- dim(jpg)[2:1] 
    plot(1,1,xlim=c(1,res[1]),ylim=c(1,res[2]),asp=1,type='n',xaxs='i',yaxs='i',xaxt='n',yaxt='n',xlab='',ylab='',bty='n', 
         main = main)
    mtext(subt, side=3)
    rasterImage(jpg,1,1,res[1],res[2])
  }
  ###
  par(mfrow = c(1,2))
  choice <- tolower(choice)
  if(!choice %in% c("rock", "paper", "scissors")){
    stop("Error: Your choice does not match either rock, paper or scissors.")
  }
  #sample Pc choice
  NPC <- sample(c("rock", "paper", "scissors"), size = 1)
  # draw as unique event
  if(choice == NPC){
   #list("Did I win?" = "Draw", "Opponent" = paste("Your opponent chose", NPC))
    list(plot_jpeg(paste0(choice,".jpg"),"You", subt = "You Drew!"), plot_jpeg(paste0(NPC,".jpg"),"Opponent", subt = "Let's go again!"))
    }
  # All combinations that result in a win
  else if(choice == "rock" & NPC == "scissors" | choice == "paper" & NPC == "rock" | choice == "scissors" &
          NPC == "paper"){
    #list("Did I win?" = "You won", "Opponent" = paste("Your opponent chose", NPC))
    list(plot_jpeg(paste0(choice,".jpg"),"You", subt = "You Won!"), plot_jpeg(paste0(NPC,".jpg"),"Opponent", subt = "You got lucky!"))
    }
  # All remaining combinations result in a loss
  else{
    #list("Did I win?" = "You lost", "Opponent" = paste("Your opponent chose", NPC))
    list(plot_jpeg(paste0(choice,".jpg"),"You", subt = "You Lost!"), plot_jpeg(paste0(NPC,".jpg"),"Opponent", subt = "You are trash!"))
    }
}
## The function isn't case sensitive but it requires correct spelling.
RPS("papEr")
RPS("Rock")
RPS("sCiSsorS")
