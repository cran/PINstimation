% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/output_classes.R
\docType{class}
\name{estimate.pin-class}
\alias{estimate.pin-class}
\alias{show,estimate.pin-method}
\title{PIN estimation results}
\usage{
\S4method{show}{estimate.pin}(object)
}
\arguments{
\item{object}{an object of class \code{estimate.pin}}
}
\description{
The class \code{estimate.pin} is a blueprint of \code{S4} objects
that store the results of the different \code{PIN} functions: \code{pin()}, \code{pin_yz()},
\code{pin_gwj()}, and \code{pin_ea()}.
}
\section{Slots}{

\describe{
\item{\code{success}}{(\code{logical}) takes the value \code{TRUE} when the estimation has
succeeded, \code{FALSE} otherwise.}

\item{\code{errorMessage}}{(\code{character})  contains an error message if the \code{PIN}
estimation has failed, and is empty otherwise.}

\item{\code{convergent.sets}}{(\code{numeric}) returns the number of initial parameter
sets at which the likelihood maximization converged.}

\item{\code{algorithm}}{(\code{character}) returns the algorithm used to determine the set
of initial parameter sets for the maximum likelihood estimation.
It takes one of the following values:
\itemize{
\item \code{"YZ"}: Yan and Zhang (2012)
\item \code{"GWJ"}: Gan, Wei and Johnstone (2015)
\item \code{"YZ*"}: Yan and Zhang (2012) as modified by Ersan and Alici (2016)
\item \code{"EA"}: Ersan and Alici (2016)
\item \code{"CUSTOM"}: Custom initial parameter sets
}}

\item{\code{factorization}}{(\code{character}) returns the factorization of the \code{PIN}
likelihood function as used in the maximum likelihood estimation.
It takes one of the following values:
\itemize{
\item \code{"NONE"}: No factorization
\item \code{"EHO"}: Easley, Hvidkjaer and O'Hara (2010)
\item \code{"LK"}: Lin and Ke (2011)
\item \code{"E"}: Ersan (2016)
}}

\item{\code{parameters}}{(\code{list}) returns the list of the maximum likelihood
estimates (\eqn{\alpha}, \eqn{\delta}, \eqn{\mu}, \eb, \es)}

\item{\code{likelihood}}{(\code{numeric}) returns the value of (the factorization of)
the likelihood function evaluated at the optimal set of parameters.}

\item{\code{pin}}{(\code{numeric}) returns the value of the probability of informed
trading.}

\item{\code{pin.goodbad}}{(\code{list}) returns a list containing a decomposition
of \code{PIN} into good-news, and bad-news \code{PIN} components. The decomposition has
been suggested in \insertCite{Brennan2016;textual}{PINstimation}. The list
has two elements: \code{pinG}, and \code{pinB} are the good-news, and bad-news
components of \code{PIN}, respectively.}

\item{\code{dataset}}{(\code{dataframe}) returns the dataset of buys and sells used
in the maximum likelihood estimation of the PIN model.}

\item{\code{initialsets}}{(\code{dataframe}) returns the initial parameter sets used
in the maximum likelihood estimation of the PIN model.}

\item{\code{details}}{(\code{dataframe}) returns a dataframe containing the estimated
parameters by the \code{MLE} method for each initial parameter set.}

\item{\code{runningtime}}{(\code{numeric}) returns the running time of the estimation
of the \code{PIN} model in seconds.}
}}

