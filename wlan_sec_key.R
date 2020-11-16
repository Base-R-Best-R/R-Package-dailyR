# operating system: win 10
# sys language: german

# required cmd commands 

# get NETWORK name 
# netsh wlan show profile 

# netsh wlan show profile NETWORK key = clear 
# this gives an output that we can use to scrape the security key of NETWORK

get_network_key <- function(){

# Get network SSID of currently connected network
  
sh1 <- shell("Netsh WLAN show interfaces", intern = T)

network <- tail(unlist(strsplit(sh1[grepl("SSID", sh1)][1], " ")), 1)

# Obtain Key

sh2 <- shell(paste("netsh wlan show profile", network, "key = clear"), intern = T)

tail(unlist(strsplit(sh2[grepl("Schl", sh2)], " ")), 1)
}

get_network_key()

