% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/midas_r_methods.R
\name{coef.midas_r}
\alias{coef.midas_r}
\title{Extract coefficients of MIDAS regression}
\usage{
\method{coef}{midas_r}(object, midas = FALSE, term_names = NULL, ...)
}
\arguments{
\item{object}{\code{midas_r} object}

\item{midas}{logical, if \code{TRUE}, MIDAS coefficients are returned, if \code{FALSE} (default), coefficients of NLS problem are returned}

\item{term_names}{a character vector with term names. Default is \code{NULL}, which means that coefficients of all the terms are returned}

\item{...}{not used currently}
}
\value{
a vector with coefficients
}
\description{
Extracts various coefficients of MIDAS regression
}
\details{
MIDAS regression has two sets of cofficients. The first set is the coefficients associated with the parameters
of weight functions associated with MIDAS regression terms. These are the coefficients of the NLS problem associated with MIDAS regression.
The second is the coefficients of the linear model, i.e  the values of weight
functions of terms, or so called MIDAS coefficients. By default the function returns the first set of the coefficients.
}
\examples{

#Simulate MIDAS regression
n<-250
trend<-c(1:n)
x<-rnorm(4*n)
z<-rnorm(12*n)
fn.x <- nealmon(p=c(1,-0.5),d=8)
fn.z <- nealmon(p=c(2,0.5,-0.1),d=17)
y<-2+0.1*trend+mls(x,0:7,4)\%*\%fn.x+mls(z,0:16,12)\%*\%fn.z+rnorm(n)
eqr<-midas_r(y ~ trend + mls(x, 0:7, 4, nealmon) +
             mls(z, 0:16, 12, nealmon),
             start = list(x = c(1, -0.5), z = c(2, 0.5, -0.1)))

coef(eqr)
coef(eqr, term_names = "x")
coef(eqr, midas = TRUE)
coef(eqr, midas = TRUE, term_names = "x")

}
\author{
Vaidotas Zemlys
}

