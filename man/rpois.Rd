% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rpois.r
\name{rpois}
\alias{rpois}
\title{rpois}
\usage{
rpois(n, lambda = 1, seed = getseed(), type = "double")
}
\arguments{
\item{n}{The number of values to generate}

\item{lambda}{Parameter for poisson random variables.}

\item{seed}{Seed for the random number generation.}

\item{type}{Ignored; present only to match API with other generators. The return is
always a vector of ints.}
}
\description{
Generate from a poisson distribution using a gpu.
}
\details{
Uses \code{curand_poisson()} from cuRAND.
}
\references{
CUDA Toolkit Documentation for cuRAND
\url{https://docs.nvidia.com/cuda/curand/index.html}
}

