##############################
####  Missing Values in R
####     tidyverse
##############################

## missing values are "NA" in r, not available
## differ from FALSE

## almost any operation involves NA has a result NA
require(tidyverse, quietly = TRUE, warn.conflicts = FALSE) 
## Using TRUE, FALSE, not T, F

NA + 1
NA^3 
NA == NA   # ALL NA output

## get a hint from the upper operation, using is.na()
################
###   is.na()
################
no_missing <- c("a", "b", 3)
is.na(no_missing)

# filter() only includes rows 
# where the condition is TRUE; it excludes both FALSE and NA
mi_now <- tibble(x=c(no_missing, NA,NA,4,5,6))    # tibble is the food for tidyverse
                                                  # x is the colnames
is.na(mi_now)

mi_now %>% filter(mi_now[,1] > 4)     # try pipline without instruction?
filter(mi_now, mi_now[,1] > 4)
filter(mi_now, x > 4)                 # two ways to call the column 

# DO not exclude missing value
filter(mi_now, is.na(x)| x > 4)

###############################
### na.rm argument in function
###############################
library(nycflights13)
summary(flights)

## also add new variable to a tibble with mutate()
## while replace old with new variable with transmute()
