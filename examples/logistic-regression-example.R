URL <- "https://raw.githubusercontent.com/DS4PS/pe4ps-textbook/master/data/admissions.csv"

dat <- read.csv( URL, stringsAsFactors=F )

head( dat )





#### LINEAR PROBABILITY MODEL 


m1 <- lm( Admission ~ LSAT + Essay + GPA, data=dat )

summary( m1 )



# Marginal effects comparison:
#
# The standard deviation is a "reasonable" 
# approximation of a big improvement.
#
# Which of these three things should I spend
# time on to improve my likelihood of admissions? 


sd.lsat <- sd( dat$LSAT )
sd.essay <- sd( dat$Essay )
sd.gpa <- sd( dat$GPA )

b0 <- m1$coefficients[1]
b1 <- m1$coefficients[2]
b2 <- m1$coefficients[3]
b3 <- m1$coefficients[4]


sd.lsat * b1     # gains from improvement in LSAT
sd.essay * b2    # gains from improvement in essay 
sd.gpa * sd.gpa  # gains from improvement in gpa



# predicted prob of success (admissions) for a specific individual:

gpa <- 3.0
lsat <- 145
essay <- 90 

b0 + b1*lsat + b2*essay + b3*gpa








#### LOGIT MODEL


m2 <- glm( Admission ~ LSAT + Essay + GPA, data = dat, family = "binomial" )

summary( m2 )




# LOGIT LINK FUNCTION 

p = 1 / ( 1 + exp( - ( b0 + b1*x1 + b2*x2 ) ) )



# predicted prob of success (admissions) for a specific individual:

b0 <- m2$coefficients[1]
b1 <- m2$coefficients[2]
b2 <- m2$coefficients[3]
b3 <- m2$coefficients[4]

gpa <- 3.0
lsat <- 145
essay <- 90 

# Model reports log-odds
y.hat <- b0 + b1*lsat + b2*essay + b3*gpa

# convert log-odds to probabilities
1 / ( 1 + exp( - ( y.hat ) ) )


# Marginal effects comparison:
#
# We must "center" other variables 
# to look at marginal effects of one (LSAT here): 

gpa <- mean( dat$GPA )  
essay <- mean( dat$Essay ) 
lsat <- 150

y.hat <- b0 + b1*lsat + b2*essay + b3*gpa

1 / ( 1 + exp( - ( y.hat ) ) )



# Expected gains change greatly depending
# on the baseline, eg LSAT of 130 vs 150 vs 170

# value of 10-point increase in LSAT 
# when current score is a 140

gpa <- mean( dat$GPA )  
essay <- mean( dat$Essay ) 

lsat <- 140
y.hat <- b0 + b1*lsat + b2*essay + b3*gpa
p.140 <- 1 / ( 1 + exp( - ( y.hat ) ) )

lsat <- 150
y.hat <- b0 + b1*lsat + b2*essay + b3*gpa
p.150 <- 1 / ( 1 + exp( - ( y.hat ) ) )

p.150 - p.140 


# value of 10-point increase in LSAT 
# when current score is a 120

lsat <- 120
y.hat <- b0 + b1*lsat + b2*essay + b3*gpa
p.120 <- 1 / ( 1 + exp( - ( y.hat ) ) )

lsat <- 130
y.hat <- b0 + b1*lsat + b2*essay + b3*gpa
p.130 <- 1 / ( 1 + exp( - ( y.hat ) ) )

p.130 - p.120 


# value of 10-point increase in LSAT 
# when current score is a 170

lsat <- 170
y.hat <- b0 + b1*lsat + b2*essay + b3*gpa
p.170 <- 1 / ( 1 + exp( - ( y.hat ) ) )

lsat <- 180
y.hat <- b0 + b1*lsat + b2*essay + b3*gpa
p.180 <- 1 / ( 1 + exp( - ( y.hat ) ) )

p.180 - p.170 



