% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stats.R
\name{cmode}
\alias{cmode}
\title{Mode from counting frequency}
\usage{
cmode(x)
}
\arguments{
\item{x}{an integer vector}
}
\value{
scalar integer value
}
\description{
Finds the most frequent value from a vector of discrete values
}
\examples{
cmode(rpois(1000, 20))
}
