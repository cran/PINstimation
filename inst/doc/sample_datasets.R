## ----loading, echo = FALSE, results = 'hide', message=FALSE, warning=FALSE----
library(PINstimation)

## ----echo=FALSE---------------------------------------------------------------
options(crayon.enabled = TRUE)
knitr::knit_hooks$set(output = function(x, options){
  paste0(
    '<pre class="r-output"><code>',
    fansi::sgr_to_html(x = htmltools::htmlEscape(x), warn = FALSE),
    '</code></pre>'
  )
})

## ----sample.pin.1.1-----------------------------------------------------------
pindata <- generatedata_mpin(layers=1, ranges = list(eps.b=c(300, 500), eps.s=c(300,500)), verbose = FALSE)

## ----sample.pin.1.2, results='markup'-----------------------------------------
show(pindata)

## ----sample.pin.1.3, results='markup'-----------------------------------------
show(pindata@data[1:10, ])

## ----sample.pin.1.4, results='markup'-----------------------------------------
actual <- unlist(pindata@empiricals)
show(actual)

## ----sample.pin.1.5, results='markup'-----------------------------------------
model <- pin_ea(data=pindata@data, verbose = FALSE)
estimates <- model@parameters 
show(estimates)

## ----sample.pin.1.6, results='markup'-----------------------------------------
errors <- abs(actual - estimates)
show(errors)

## ----sample.mpin.1.1----------------------------------------------------------
mpindata <- generatedata_mpin(layers=2, ranges = list(eps.b=c(12000, 15000), eps.s=c(12000,15000)), verbose = FALSE)

## ----sample.mpin.1.2, results='markup'----------------------------------------
show(mpindata)

## ----sample.mpin.1.3, results='markup'----------------------------------------
show(mpindata@data[1:10, ])

## ----sample.mpin.1.4, results='markup'----------------------------------------
actualmpin <- unlist(mpindata@emp.pin)
show(actualmpin)

## ----sample.mpin.1.5, results='markup'----------------------------------------
model_ml <- mpin_ml(data=mpindata@data, verbose = FALSE)
model_ecm <- mpin_ecm(data=mpindata@data, verbose = FALSE)
mlmpin <- model_ml@mpin
ecmpin <- model_ecm@mpin
estimates <- setNames(c(mlmpin, ecmpin), c("ML", "ECM"))
show(estimates)

## ----sample.mpin.1.6, results='markup'----------------------------------------
errors <- abs(actualmpin - estimates)
show(errors)

## ----sample.mpin.1.7, results='markup'----------------------------------------
size <- 10
collection <- generatedata_mpin(series = size, layers = 3, verbose = FALSE)
show(collection)

## ----sample.mpin.1.8, results='markup'----------------------------------------
accuracy <- devmpin <- 0
for (i in 1:size) {
    sdata <- collection@datasets[[i]]
    model <- mpin_ml(sdata@data, xtraclusters = 3, verbose=FALSE)
    accuracy <- accuracy + (sdata@layers == model@layers)
    devmpin <- devmpin + abs(sdata@emp.pin - model@mpin)
    
}
cat('The accuracy of layer detection: ', paste0(accuracy*(100/size),"%.\n"), sep="")
cat('The average error in MPIN estimates: ', devmpin/size, ".\n", sep="")

## ----sample.adjpin.1.1--------------------------------------------------------
adjpindatasets <- generatedata_adjpin(series = 10, ranges = list(eps.b=c(10000, 15000), eps.s=c(10000,15000)), verbose = FALSE)

## ----sample.adjpin.1.2, results='markup'--------------------------------------
show(adjpindatasets)

## ----sample.adjpin.1.3, results='markup'--------------------------------------
adjpindata <- adjpindatasets@datasets[[1]]
show(adjpindata)

## ----sample.adjpin.1.4, results='markup'--------------------------------------
actualpins <- unlist(adjpindata@emp.pin)
show(actualpins)

## ----sample.adjpin.1.5, results='markup'--------------------------------------
model_ml <- adjpin(data=adjpindata@data, method = "ML", verbose = FALSE)
model_ecm <- adjpin(data=adjpindata@data, method = "ECM", verbose = FALSE)
mlpins <- c(model_ml@adjpin, model_ml@psos)
ecmpins <- c(model_ecm@adjpin, model_ecm@psos)
estimates <- rbind(mlpins, ecmpins)
colnames(estimates) <- c("adjpin", "psos")
rownames(estimates) <- c("ML", "ECM")
show(estimates)

## ----sample.adjpin.1.6, results='markup'--------------------------------------
errors <- abs(estimates - rbind(actualpins, actualpins))
show(errors)

