door <- c(1,2,3)
cardoor <- sample(door,1)
choice <- sample(door,1)
?setdiff
rm(revealoptions)

num_simulations <- 100000  # Set the number of simulations here

n_stay <- 0
n_switch <- 0

for (i in 1:num_simulations) {
  doors <- c(1, 2, 3)  # Available doors
  car_door <- sample(doors, 1)  # Randomly assign a car behind one door
  choice <- sample(doors, 1)  # Player makes an initial choice
  
  goat_doors <- setdiff(doors, car_door)  # Doors that have goats
  reveal_options <- setdiff(goat_doors, choice)  # Doors that can be revealed
  
  # If the player's initial choice is the car, randomly pick a door to reveal
  if (choice == car_door) {
    reveal <- sample(reveal_options, 1)
  } else {
    reveal <- reveal_options  # If the choice is wrong, reveal the only available goat door
  }
  
  remaining_doors <- setdiff(doors, reveal)  # Doors left after revealing a goat
  new_choice <- setdiff(remaining_doors, choice)  # The other door if the player switches
  
  # Track stay and switch wins
  if (choice == car_door) {
    n_stay <- n_stay + 1
  }
  if (new_choice == car_door) {
    n_switch <- n_switch + 1
  }
}

cat("Winning probability when staying:", n_stay / num_simulations, "\n")
cat("Winning probability when switching:", n_switch / num_simulations, "\n")
