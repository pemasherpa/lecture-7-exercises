#### Exercise 2 ###

# Install devtools package: allows installations from GitHub
# install.packages('devtools')

# Install "fueleconomy" package from GitHub
# devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
# library(fueleconomy)

# You should have have access to the vehicles data.frame
# View(vehicles)

# Create a data.frame of vehicles from 1997 (using dplyr)
cars_1997 <- filter(vehicles, year==1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(cars_1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city (using dplyr)
two_wheel_20_mpg <- filter(vehicles, drive == '2-Wheel Drive', cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg? (using dplyr)
filtered <- filter(two_wheel_20_mpg, hwy == min(hwy))
worst_hwy <- select(filtered, id)
# In one step
worst_hwy <- select(
              filter(two_wheel_20_mpg, hwy == min(hwy)), id
              )

# Write a function that takes a year and a make as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year (using dplyr)
make_year_filter <- function(my_make, year) {
  filtered <- filter(vehicles, make == my_make, year == my_year)
  return(filter(filtered, hwy == max(hwy)))
}

# What was the most efficient honda model of 1995?
make_year_filter('Honda', 1995)

