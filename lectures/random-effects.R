# NAME: Car Data
# TYPE: Multiple Regression
# SIZE: 810 observations, 12 variables
#  
# DESCRIPTIVE ABSTRACT:
# Data collected from Kelly Blue Book for several hundred 2005 used GM cars allows students to develop 
# a multivariate regression model to determine their car value based on a variety of characteristics 
# such as mileage, make, model, engine size, interior style, and cruise control. Students learn to 
# look at residual plots and check for heteroskedasticity, autocorrelation, and multicollinearity.
# 
# SOURCES:
# 
# For this data set, a representative sample of over eight hundred, 2005 GM cars were selected, 
# then an algorithm was developed following the 2005 Central Edition of the Kelly Blue Book to 
# estimate retail price. </p>
# 
# VARIABLE DESCRIPTIONS:
# Price: suggested retail price of the used 2005 GM car in excellent condition. The condition of a 
#         car can greatly affect price. All cars in this data set were less than one year old when 
#         priced and considered to be in excellent condition. 
# Mileage: number of miles the car has been driven
# Make: manufacturer of the car such as Saturn, Pontiac, and Chevrolet
# Model: specific models for each car manufacturer such as Ion, Vibe, Cavalier
# Trim (of car): specific type of car model such as SE Sedan 4D, Quad Coupe 2D
# Type: body type such as sedan, coupe, etc.
# Cylinder: number of cylinders in the engine	
# Liter: a more specific measure of engine size
# Doors: number of doors
# Cruise: indicator variable representing whether the car has cruise control (1 = cruise)
# Sound: indicator variable representing whether the car has upgraded speakers (1 = upgraded)
# Leather: indicator variable representing whether the car has leather seats (1 = leather)
# 
# 
# SUBMITTED BY:
# Shonda Kuiper
# Grinnell College


URL <- "https://raw.githubusercontent.com/DS4PS/pe4ps-textbook/master/data/car-prices-sub.csv"
d2 <- read.csv( URL, stringsAsFactors=F )
head( d2 )



summary( lm( Price ~ Mileage, data=d2 ) )
summary( lm( Price ~ Mileage + factor(Model), data=d2 ) )



palette( hcl(h = c(15,135,255), c = 100, l = 65) )
plot( d2$Mileage, d2$Price, col=factor(d2$Model), pch=19, cex=2 )
abline( lm( Price ~ Mileage, data=d2 ), col="gray20", lwd=3 )




m1 <- lm( Price ~ Mileage + factor(Model), data=d2 )

b0 <- m1$coefficients[1]
b1 <- m1$coefficients[2]
b2 <- m1$coefficients[3]
b3 <- m1$coefficients[4]

# add transparency to color palette
palette( adjustcolor( palette(), alpha.f = 0.5 ) )

plot( d2$Mileage, d2$Price, col=factor(d2$Model), pch=19, cex=2,
      bty="n", xlab="Mileage", ylab="Sales Price",
      main="Used Car Sales Price" )
abline( a=b0, b=b1, col=palette()[1], lwd=10 )
abline( a=b0+b2, b=b1, col=palette()[2], lwd=10 )
abline( a=b0+b3, b=b1, col=palette()[3], lwd=10 )
abline( lm( Price ~ Mileage, data=d2 ), col="gray20", lwd=5 )




par( mfrow=c(1,2) )

### RESIDUALS

m2 <- lm( Price ~ Mileage, data=d2 )

palette( adjustcolor( palette(), alpha.f = 0.2 ) )
plot( d2$Mileage, d2$Price, col=factor(d2$Model), pch=19, cex=2,
      bty="n", xlab="Mileage", ylab="Price",
      main="Pooled Model - Large Residuals" )
abline( m2, col="gray60", lwd=3 )

palette( c("#F8766D", "#00BA38", "#619CFF") )
segments( x0=d2$Mileage, y0=d2$Price, y1=m2$fitted.values,
          col=factor(d2$Model), lwd=2 )



### INCREASED EFFICIENCY


d3 <- data.frame( d2, fitted=m1$fitted.values )

palette( c("#F8766D", "#00BA38", "#619CFF") )

palette( adjustcolor( palette(), alpha.f = 0.2 ) )
plot( d2$Mileage, d2$Price, col=factor(d2$Model), pch=19, cex=2,
      bty="n", xlab="Mileage", ylab="Price",
      main="Car Model Intercepts - Smaller Residuals" )
abline( a=b0, b=b1, col=palette()[1], lwd=5 )
abline( a=b0+b2, b=b1, col=palette()[2], lwd=5 )
abline( a=b0+b3, b=b1, col=palette()[3], lwd=5 )

palette( c("#F8766D", "#00BA38", "#619CFF") )
segments( x0=d2$Mileage, y0=d2$Price, y1=m1$fitted.values,
          col=factor(d2$Model), lwd=2 )



# standard errors on mileage coefficient half the size
summary( lm( Price ~ Mileage, data=d2 ) )
summary( lm( Price ~ Mileage + factor(Model), data=d2 ) )



