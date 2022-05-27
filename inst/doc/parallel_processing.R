## ----loading, echo = FALSE, results = 'hide', message=FALSE, warning=FALSE----
library(PINstimation)

## ----option.1.1---------------------------------------------------------------
options(pinstimation.parallel.cores = 3)

## ----option.1.2---------------------------------------------------------------
getOption("pinstimation.parallel.cores")

## ----option.1.3---------------------------------------------------------------
options(pinstimation.parallel.cores = -2)
getOption("pinstimation.parallel.cores")

## ----option.1.4, results=F----------------------------------------------------
xdata <- hfdata
xdata$volume <- NULL
aggdata <- aggregate_trades(xdata, timelag = 500, algorithm = "LR")

## ----option.1.5---------------------------------------------------------------
getOption("pinstimation.parallel.cores")

## ----option.2-----------------------------------------------------------------
options("pinstimation.parallel.threshold" = 20)

## ----option.2.1.1, results=F--------------------------------------------------
ecm.1 <- mpin_ecm(data = dailytrades, is_parallel = FALSE)

## ----option.2.1.2, results='markup', echo=FALSE-------------------------------
show(ecm.1)

## ----option.2.2.1, results=F--------------------------------------------------
ecm.2 <- mpin_ecm(dailytrades, layers = 2, is_parallel = TRUE)

## ----option.2.21.2, results='markup', echo=FALSE------------------------------
show(ecm.2)

## ----option.2.3.1, results='hide'---------------------------------------------
ecm.3 <- mpin_ecm(dailytrades, layers = 3, is_parallel = TRUE)

## ----option.2.3.2, results='markup', echo=FALSE-------------------------------
show(ecm.3)

