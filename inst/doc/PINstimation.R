## ----installation, results = 'hide', message=FALSE, warning=FALSE-------------
library(PINstimation)

## ----Example.1.1, results=F---------------------------------------------------
estimate <- pin_ea(dailytrades)

## ----Example.1.2--------------------------------------------------------------
show(estimate)

## ----Example.2.1, results=F---------------------------------------------------
ml_estimate <- mpin_ml(dailytrades)

## ----Example.2.2, results=F---------------------------------------------------
ecm_estimate <- mpin_ecm(dailytrades)

## ----Example.2.3--------------------------------------------------------------
mpin_comparison <- rbind(ml_estimate@aggregates, ecm_estimate@aggregates)
rownames(mpin_comparison) <- c("ML", "ECM")

## ----Example.2.4, echo=F, eval=T----------------------------------------------
cat("Probabilities of ML, and ECM estimations of the MPIN model\n")
print(mpin_comparison)

## ----Example.2.5, eval=FALSE--------------------------------------------------
#  summary <- getSummary(ecm_estimate)

## ----Example.3.1, results=F---------------------------------------------------
estimate_adjpin <- adjpin(dailytrades, initialsets = "GE")

## ----Example.3.2--------------------------------------------------------------
show(estimate_adjpin)

## ----Example.4.1--------------------------------------------------------------
estimate.vpin <- vpin(hfdata, timebarsize = 300)

## ----Example.4.2, results = F-------------------------------------------------
show(estimate.vpin)

## ----Example.4.3, dev='png'---------------------------------------------------
plot(estimate.vpin@dailyvpin$dvpin ~seq_len(nrow(estimate.vpin@dailyvpin)),
     lwd=1 , type="l" , bty="n" , xlab="day" , ylab="daily vpin", 
     col=rgb(0.2,0.4,0.6,0.8) )

## ----Example.5.1--------------------------------------------------------------
data <- hfdata
data$volume <- NULL

## ----Example.5.2, results=F---------------------------------------------------
daytrades <- aggregate_trades(data, algorithm = "LR", timelag = 500)

## ----Example.5.4, results=F---------------------------------------------------
adjpin_ml <- adjpin(daytrades, method = "ML", initialsets = "GE")

## ----Example.5.5, results=F---------------------------------------------------
adjpin_ecm <- adjpin(daytrades, method = "ECM", initialsets = "GE")

## ----Example.5.6, results=F---------------------------------------------------
adj.prob <- rbind(adjpin_ml@parameters[1:4], adjpin_ecm@parameters[1:4])
rownames(adj.prob) <- c("ML", "ECM")

## ----Example.5.7, echo=F, eval=T----------------------------------------------
cat("Probability terms in ML and ECM estimations of the AdjPIN model\n")
print(adj.prob)

## ----Example.5.8, results=F---------------------------------------------------
adj.params <- rbind(adjpin_ml@parameters[5:10], adjpin_ecm@parameters[5:10])
rownames(adj.params) <- c("ML", "ECM")

## ----Example.5.9, echo=F, eval=T----------------------------------------------
cat("Rate parameters of ML and ECM estimations of the AdjPIN model\n")
print(adj.params)

