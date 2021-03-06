% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modsel.R
\name{lf_lags_table}
\alias{lf_lags_table}
\title{Create a low frequency lag selection table for MIDAS regression model}
\usage{
lf_lags_table(formula, data, start, from, to, IC = c("AIC", "BIC"),
  test = c("hAh_test"), Ofunction = "optim", weight_gradients = NULL, ...)
}
\arguments{
\item{formula}{the formula for MIDAS regression, the lag selection is performed for the last MIDAS lag term in the formula}

\item{data}{a list containing data with mixed frequencies}

\item{start}{the starting values for optimisation}

\item{from}{a named list, or named vector with high frequency (NB!) lag numbers which are the beginnings of MIDAS lag structures. The names should correspond to the MIDAS lag terms in the formula for which to do the lag selection. Value NA indicates lag start at zero}

\item{to}{a named list where each element is a vector with two elements. The first element is the low frequency lag number from which the lag selection starts, the second is the low frequency lag number at which the lag selection ends. NA indicates lowest (highest) lag numbers possible.}

\item{IC}{the information criteria which to compute}

\item{test}{the names of statistical tests to perform on restricted model, p-values are reported in the columns of model selection table}

\item{Ofunction}{see \link{midasr}}

\item{weight_gradients}{see \link{midas_r}}

\item{...}{additional parameters to optimisation function, see \link{midas_r}}
}
\value{
a \code{midas_r_ic_table} object which is the list with the following elements:

\item{table}{the table where each row contains calculated information criteria for both restricted and unrestricted MIDAS regression model with given lag structure}
\item{candlist}{the list containing fitted models}
\item{IC}{the argument IC}
}
\description{
Creates a low frequency lag selection table for MIDAS regression model with given information criteria and minimum and maximum lags.
}
\details{
This function estimates models sequentially increasing the midas lag from \code{kmin} to \code{kmax} of the last term of the given formula
}
\examples{

data("USunempr")
data("USrealgdp")
y <- diff(log(USrealgdp))
x <- window(diff(USunempr),start=1949)
trend <- 1:length(y)

mlr <- lf_lags_table(y~trend+fmls(x,12,12,nealmon),
                     start=list(x=rep(0,3)),
                     from=c(x=0),to=list(x=c(3,4)))
mlr

}
\author{
Virmantas Kvedaras, Vaidotas Zemlys
}

