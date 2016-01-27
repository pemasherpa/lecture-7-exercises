#### Exercise 1 ###

# Install devtools package: allows installations from GitHub
# install.packages('devtools')

# Install "fueleconomy" package from GitHub
# devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
# library(fueleconomy)

# You should have have access to the vehicles data.frame
# View(vehicles)

# Which Accura model has the best hwy MPG in 2015? (without method chaining)
acuras <- filter(vehicles, make == "Acura", year == 2015)
best_acura <- filter(acuras, hwy == max(hwy))
best_model <- select(best_acura, model)

# Which Accura model has the best hwy MPG in 2015? (nesting functions)
best_model <- select(
                filter(
                  filter(vehicles, make == "Acura", year == 2015), hwy == max(hwy)
                ), model
)

# Which Accura model has the best hwy MPG in 2015? (pipe operator)
best_model <- filter(vehicles, make == "Acura", year == 2015) %>%
                filter(hwy == max(hwy)) %>% 
                  select(model)

### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times
