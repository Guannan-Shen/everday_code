require(tidyverse, quietly = TRUE, warn.conflicts = FALSE)
# mpg
# the dataset, uncomment the upperline to view the first 10 rows of mpg
glimpse(mpg)
?mpg                     # mpg information in the package
# plot x = displ, y = hwy
## wesanderson
## Use Wes Anderson color palettes

library(wesanderson)
ggplot(mpg, aes(displ, hwy, colour = manufacturer)) +
   geom_point() +
   theme_light() +
   xlab("engine displacement in litres") +
   ylab("highway miles per gallon") +
   scale_color_manual(values=wes_palette(n =15, name="Zissou", type = "continuous"))
## more than normal (5) levels of colours
## color list 
## https://github.com/karthik/wesanderson/blob/master/R/colors.R
