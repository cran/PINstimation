% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_mpin.R
\name{mpin_ml}
\alias{mpin_ml}
\title{MPIN model estimation via standard ML methods}
\usage{
mpin_ml(data, layers = NULL, xtraclusters = 4, initialsets = NULL,
detectlayers = "EG", ..., verbose = TRUE)
}
\arguments{
\item{data}{A dataframe with 2 variables: the first
corresponds to buyer-initiated trades (buys), and the second corresponds
to seller-initiated trades (sells).}

\item{layers}{An integer referring to the assumed number of
information layers in the data. If the argument \code{layers} is given,
then the maximum likelihood estimation will use the number of layers
provided. If \code{layers} is omitted,
the function \code{mpin_ml()} will find the optimal number of layers using
the algorithm developed in \insertCite{Ersan2022a;textual}{PINstimation}
(as default).}

\item{xtraclusters}{An integer used to divide trading days into
\code{(1 + layers + xtraclusters)} clusters, thereby resulting in
\code{#comb(layers + xtraclusters, layers)} initial parameter sets in line
with \insertCite{ErsanAlici2016;textual}{PINstimation}, and
\insertCite{Ersan2016;textual}{PINstimation}. The default value is \code{4} as
chosen in \insertCite{Ersan2016;textual}{PINstimation}.}

\item{initialsets}{A dataframe containing initial parameter
sets for the estimation of the \code{MPIN} model. The default value is \code{NULL}.
If \code{initialsets} is \code{NULL}, the initial parameter sets are determined by the
function \code{initials_mpin()}.}

\item{detectlayers}{A character string referring to the layer
detection algorithm used to determine the number of  layer in the data. It
takes one of three values: \code{"E"}, \code{"EG"}, and \code{"ECM"}. \code{"E"} refers to the
algorithm in \insertCite{Ersan2016;textual}{PINstimation}, \code{"EG"} refers to
the algorithm in \insertCite{Ersan2022a;textual}{PINstimation};
while \code{"ECM"} refers to the algorithm in
\insertCite{Ghachem2022;textual}{PINstimation}.
The default value is \code{"EG"}. Comparative results between the layer detection
algorithms can be found in \insertCite{Ersan2022a;textual}{PINstimation}.}

\item{...}{Additional arguments passed on to the function \code{mpin_ml}. The
recognized argument is \code{is_parallel}. \code{is_parallel} is a logical variable
that specifies whether the computation is performed using parallel
processing. The default value is \code{FALSE}.}

\item{verbose}{A binary variable that determines whether detailed
information about the steps of the estimation of the MPIN model is displayed.
No output is produced when \code{verbose} is set to \code{FALSE}. The default
value is \code{TRUE}.}
}
\value{
Returns an object of class \code{estimate.mpin}
}
\description{
Estimates the multilayer probability of informed trading
(\code{MPIN}) using the standard Maximum Likelihood method.
}
\details{
The argument 'data' should be a numeric dataframe, and contain
at least two variables. Only the first two variables will be considered:
The first variable is assumed to correspond to the total number of
buyer-initiated trades, while the second variable is assumed to
correspond to the total number of seller-initiated trades. Each row or
observation correspond to a trading day. \code{NA} values will be ignored. \cr
}
\examples{
# There is a preloaded quarterly dataset called 'dailytrades' with 60
# observations. Each observation corresponds to a day and contains the
# total number of buyer-initiated trades ('B') and seller-initiated
# trades ('S') on that day. To know more, type ?dailytrades

xdata <- dailytrades

# ------------------------------------------------------------------------ #
# Estimate MPIN model using the standard ML method                         #
# ------------------------------------------------------------------------ #

# Estimate the MPIN model using mpin_ml() assuming that there is a single
# information layer in the data. The model is then equivalent to the PIN
# model. The argument 'layers' takes the value '1'.
# We use two extra clusters to generate the initial parameter sets.

estimate <- mpin_ml(xdata, layers = 1, xtraclusters = 2, verbose = FALSE)

# Show the estimation output

show(estimate)

# Estimate the MPIN model using the function mpin_ml(), without specifying
# the number of layers. The number of layers is then detected using Ersan and
# Ghachem (2022a).
# -------------------------------------------------------------
\donttest{
estimate <- mpin_ml(xdata, xtraclusters = 2, verbose = FALSE)
}
# Show the estimation output

show(estimate)

# Display the likelihood-maximizing parameters

show(estimate@parameters)

# Display the global multilayer probability of informed trading

show(estimate@mpin)

# Display the multilayer probabilities of informed trading per layer

show(estimate@mpinJ)

# Display the first five initial parameters sets used in the maximum
# likelihood estimation

show(round(head(estimate@initialsets, 5), 4))

}
\references{
\insertAllCited
}
