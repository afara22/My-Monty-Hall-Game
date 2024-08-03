#create function to begin the game
monty_game <- function() {
  
  #Defined vectors/variables used in game
  curr_doors <- c("  ?  ", "  ?  ", "  ?  ")
  names(curr_doors) <- c("Door1", "Door2", "Door3")
  randomize_doors <- sample(c("Supermodel", "Woman1", "Woman2"))
  
  #randomize the girls behind doors
  rand_vec <- sample(c("SuperModel", "Woman1", "Woman2"))
  
  #Introduce the game
  cat("Welcome to my own version of the Monty Hall Game!\n")
  cat("Press p (and enter) to play: ")
  repeat {
    user_input <- readline()
    if (user_input == "p") {
      cat("\nThere are three doors. Behind one is a beautiful \nsupermodel. ")
      cat("Behind the other two are woman \nwith great personalites, but unknown appearance.")
      cat("\nYou will play a game of chance and whoever you end\nup with, you'll marry! Good Luck!\n\n          ", names(curr_doors),"\n          ", curr_doors, "\n\n")
      
      #prompt user to choose a door
      cat("Choose a door: ")
      user_door <- as.integer(readline())
      
      #user's initial pick
      firstpick <- rand_vec[user_door]
      
      #reveal door with woman 1 or 2
      if (firstpick == "Woman1" | firstpick == "Woman2") {
        indexOfR <- which(rand_vec != firstpick & rand_vec != "SuperModel")
        curr_doors[indexOfR] <- rand_vec[indexOfR]
      }else {
        indexOfR <- which(rand_vec == "Woman1")
        curr_doors[indexOfR] <- rand_vec[indexOfR]
      }
      
      cat("          ",names(curr_doors),"\n          ", curr_doors, "\n\n")
      
      #Ask user if want to stay or switch
      cat("Would you like to stay or switch(N or S): ")
      user_choice <- readline()
      
      #Stay scenario
      if (user_choice == "N") {
        if (firstpick == "SuperModel") {
          cat("Congratulations! You get to marry a supermodel!")
        }else {
          cat("Sorry :( you marry", firstpick)
        }
      }else{ #Switch scenario
          if (firstpick == "SuperModel") {
            if ("Woman1" %in% curr_doors) {
              cat("Sorry :( you marry Woman2")
            }else {
              cat("Sorry :( you marry Woman1")
            }
            
          }else{
            cat("Congratulations! You get to marry a supermodel!")
          }
        }
        
      break
    } else {
      cat("You did not press 'p'. Please press 'p' to play: ")
    }
  }

}



