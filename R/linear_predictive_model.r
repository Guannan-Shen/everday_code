require(tidyverse, quietly = TRUE, warn.conflicts = FALSE)
library(rms)
## a ran.normal vector
set.seed(6)                          # reproducible
x <- rnorm(100)                        # default mean 0 ,1
eps1 <- rnorm(100,0,0.25)                # variance 0.25
x2 <- x^2
## the dependent variable
y1 <- -1 + 0.5*x + eps1

## scatter plot
line.simu <- tibble(y1,x,eps1)
p1 <- ggplot(line.simu, mapping = aes(x,y1)) + 
    geom_point(colour = "orangered2") +
    labs(x = "a N(0,1) variable", y= "the dependent variable")
p1

## build a linear model
## plot align
par(mfrow=c(1,2))
modline1 <- lm(y1 ~ x)
summary(modline1)
plot(modline1, which = 1)

## build a quadratic model

modqua1 <- lm(y1 ~ x + x2)
summary(modqua1)
plot(modqua1, which = 1)
anova(modline1,modqua1)

#####################
### repeat with less noise, less error
##########
set.seed(2)  
eps2 <- rnorm(100,0,0.05)               # variance 0.1
## the dependent variable
y2 <- -1 + 0.5*x + eps2
## scatter plot
line.simu2 <- tibble(y2,x,eps2)
p2 <- ggplot(line.simu2, mapping = aes(x,y2)) + 
    geom_point(colour = "orangered1", size = 1) +
    labs(x = "a N(0,1) variable", y= "the dependent variable, less noise")
p2

## build a linear model
## plot align
par(mfrow=c(1,2))
modline2 <- lm(y2 ~ x)
summary(modline2)
plot(modline2, which = 1)

## build a quadratic model
modqua2 <- lm(y2 ~ x + x2)
summary(modqua2)
plot(modqua2, which = 1)
anova(modline2,modqua2)


########### stop compare noise
## create predictive bands
### or interval = "confidence" for 95% confidence interval
predic_varline <- predict(modline1 , interval="prediction")
predic_varqua <-  predict(modqua1, interval ="prediction")

## new data contains predictive interval
qua.simu <- cbind(line.simu, predic_varqua)
line.simu <- cbind(line.simu, predic_varline)

## plot linear regression
pline <- p1 +
    labs(title ="linear regression") +
    geom_smooth(method = lm, se = FALSE) + 
    geom_line(aes(y=lwr), data = line.simu, color = "red", linetype = "dashed")+
    geom_line(aes(y=upr), data = line.simu, color = "red", linetype = "dashed")
pline

## 
## plot linear regression
pqua <- p1 +
    labs(title ="linear regression, quadratic") +
    geom_smooth(method = lm, se = FALSE, formula = y1 ~ poly(x, 2)) + 
    geom_line(aes(y=lwr), data = qua.simu, color = "red", linetype = "dashed")+
    geom_line(aes(y=upr), data = qua.simu, color = "red", linetype = "dashed")
pqua

lesspre <- predict(modline2, interval ="prediction")
lineless <- data.frame(cbind(y2,x, lesspre))
pless <- ggplot(lineless, mapping = aes(x,y2)) + 
    geom_point(colour = "orangered2") +
    labs(x = "a N(0,1) variable", y= "the dependent variable, less noise") + 
    labs(title ="linear regression, less noise") +
    geom_smooth(method = "lm", se=FALSE)+
    geom_line(aes(y=lwr), color = "red", linetype = "dashed")+
    geom_line(aes(y=upr),  color = "red", linetype = "dashed")
pless
### using rms package and fit

fline1 <- ols(y1 ~ x,  x=TRUE, y=TRUE)
validate(fline1, B = 1000)
fqua1 <- ols(y1 ~ x + x2, x=TRUE, y=TRUE)
validate(fqua1, B = 1000)
