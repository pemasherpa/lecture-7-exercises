#### Exercise 2 ###

# Install devtools package: allows installations from GitHub
install.packages('devtools')
install.packages('dplyr')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)
library(dplyr)

# You should have have access to the vehicles data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997 (using dplyr)
vehicles_1997 <- filter(vehicles, year==1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(vehicles_1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city (using dplyr)
twd <- filter(vehicles, drive == "2-Wheel Drive", cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg? (using dplyr)
worst <- select(filter(twd, hwy == min(hwy)), id)

# Write a function that takes a year and a make as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year (using dplyr)
year_make <- function(year, make) {
  my_car <- filter(vehicles, year == year, make == make)
  return (filter(my_car, hwy == max(hwy)))
}

# What was the most efficient honda model of 1995?
honda <- year_make(1995, "Honda")

