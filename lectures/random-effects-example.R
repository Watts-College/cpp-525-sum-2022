dat <- read.csv( file.choose() )


head( dat )



dat <- read.csv( "car-prices.csv", stringsAsFactors=F )



summary( lm( Price ~ Mileage, data=dat ) )


summary( lm( Price ~ Mileage + factor(Model), data=dat ) )



AVEO Malibu Cavalier Corvette

d2 <- dat[ dat$Model %in% c("AVEO","Cobalt","Cavalier") , ]

hcl(h = c(15,135,255), c = 100, l = 65)
[1] "#F8766D" "#00BA38" "#619CFF"

palette( hcl(h = c(15,135,255), c = 100, l = 65) )

plot( d2$Mileage, d2$Price, col=factor(d2$Model), pch=19, cex=2 )


palette( adjustcolor( palette(), alpha.f = 0.5 ) )


summary( lm( Price ~ Mileage, data=d2 ) )

summary( lm( Price ~ Mileage + factor(Model), data=d2 ) )

abline( a=, b=-0.100989


m1 <- lm( Price ~ Mileage + factor(Model), data=d2 )
m1$coefficients 

b0 <- m1$coefficients[1]
b1 <- m1$coefficients[2]
b2 <- m1$coefficients[3]
b3 <- m1$coefficients[4]


c("#F8766D", "#00BA38", "#619CFF")

# add transparency to color palette
palette( adjustcolor( palette(), alpha.f = 0.5 ) )


plot( d2$Mileage, d2$Price, col=factor(d2$Model), pch=19, cex=2,
      bty="n", xlab="Mileage", ylab="Sales Price",
      main="Used Car Sales Price" )
abline( a=b0, b=b1, col=palette()[1], lwd=10 )
abline( a=b0+b2, b=b1, col=palette()[2], lwd=10 )
abline( a=b0+b3, b=b1, col=palette()[3], lwd=10 )
abline( lm( Price ~ Mileage, data=d2 ), col="gray20", lwd=5 )






d3 <- data.frame( d2, fitted=m1$fitted.values )

palette( c("#F8766D", "#00BA38", "#619CFF") )

palette( adjustcolor( palette(), alpha.f = 0.2 ) )
plot( d2$Mileage, d2$Price, col=factor(d2$Model), pch=19, cex=2,
      bty="n", xlab="Mileage", ylab="Price" )
abline( a=b0, b=b1, col=palette()[1], lwd=5 )
abline( a=b0+b2, b=b1, col=palette()[2], lwd=5 )
abline( a=b0+b3, b=b1, col=palette()[3], lwd=5 )

palette( c("#F8766D", "#00BA38", "#619CFF") )
segments( x0=d2$Mileage, y0=d2$Price, y1=m1$fitted.values,
          col=factor(d2$Model), lwd=2 )


m2 <- lm( Price ~ Mileage, data=d2 )

palette( adjustcolor( palette(), alpha.f = 0.2 ) )
plot( d2$Mileage, d2$Price, col=factor(d2$Model), pch=19, cex=2,
      bty="n", xlab="Mileage", ylab="Price" )
abline( m2, col="gray60", lwd=3 )

palette( c("#F8766D", "#00BA38", "#619CFF") )
segments( x0=d2$Mileage, y0=d2$Price, y1=m2$fitted.values,
          col=factor(d2$Model), lwd=2 )




plot( d2$Mileage, d2$Price, col=factor(d2$Model), pch=19, cex=2 )
abline( lm( Price ~ Mileage, data=d2 ), col="gray20", lwd=3 )

m1 <- lm( Price ~ Mileage + factor(Model), data=d2 )




 

