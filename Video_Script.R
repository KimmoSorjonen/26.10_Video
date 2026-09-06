
############################# BIENVENUE #############################

############# I SOLEMNLY SWEAR THAT I AM UP TO NO GOOD ##############

#################################
## Loading packages

library(lavaan)

#################################

n <- 254 ## sample size

rm <- matrix(c( ## correlations reported by Guo et al. (2026)
  
   1.000, -0.246, -0.286, -0.431,
  -0.246,  1.000,  0.436,  0.444,
  -0.286,  0.436,  1.000,  0.613,
  -0.431,  0.444,  0.613,  1.000), nrow=4)

colnames(rm) <- rownames(rm) <- c("VA","SE","WB","SC") ## names of variables

#################################
## Alternative model

altmod <- "

## Loadings

CSE =~ VA+1*SE+WB+SC

## Intercepts, set to zero

VA ~ 0*1
SE ~ 0*1
WB ~ 0*1
SC ~ 0*1

CSE ~ 0*1

## (Error) variances

VA ~~ VA
SE ~~ SE
WB ~~ WB
SC ~~ SC

CSE ~~ CSE

"

fit.alt <- lavaan(altmod, sample.cov=rm, ## fitting model to data 
            sample.nobs=n, sample.mean=rep(0,4))

summary(fit.alt, fit.measures=T, ci=T, standardized=T, rsq=T) ## the results


########################## MISCHIEF MANAGED #########################

############################# AU REVOIR #############################


