############################
## the grammar of plot
###########################
##the grammar tells us that a statistical graphic is a mapping from data to aesthetic
## attributes (colour, shape, size) of geometric objects (points, lines, bars).

## for dynamic and interactive graphics : ggvis

# htmlwidgets provides a common framework for accessing web visualisation tools from R.

require(tidyverse, quietly = TRUE, warn.conflicts = FALSE)
## get more information of mpg
summary(mpg)
str(mpg)
tail(mpg,10)
head(mpg,10)
typeof(mpg)
names(mpg)
## i forgot
class(mpg)
dplyr::glimpse(mpg)  ## similar to str()

## transfer cty and hwy to fuelperdis

fuelperdis <-  function(dispergallon){
  ratio <- 100/dispergallon
  fuelof100mile <- ratio*1
  fuelof100mile
}
## only show the head
apply(mpg[,c("cty","hwy")],2,fuelperdis) %>% head()

## or by the dplyr functions transmute or mutate
mpg %>% 
  dplyr::transmute(
        "cityfuel100mile" = fuelperdis(cty),
        "highwayfuel100mile"= fuelperdis(hwy)
  )
