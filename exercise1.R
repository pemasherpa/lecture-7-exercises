#### Exercise 1 ###

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# You should have have access to the vehicles data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997
vehicles_from_1997 <- vehicles[vehicles$year == 1997,]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(vehicles_from_1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
vehicles_2wd <- vehicles[vehicles$drive == "2-Wheel Drive" & vehicles$cty > 20,]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst_hwy_mpg <- vehicles_2wd$id[vehicles_2wd$hwy == min(vehicles_2wd$hwy)]

# Write a function that takes a year and a make as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
make_year <- function(year, make) {
  my_cars <- vehicles[vehicles$year == year & vehicles$make == make, ]
  car <- my_cars[my_cars$hwy == max(my_cars$hwy), ]
  return (car)
}

# What was the most efficient honda model of 1995?
honda_95 <- make_year(1995, "Honda")

