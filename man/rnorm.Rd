% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rnorm.r
\name{rnorm}
\alias{rnorm}
\title{rnorm}
\usage{
rnorm(n, mean = 0, sd = 1, seed = getseed(), type = "double")
}
\arguments{
\item{n}{The number of values to generate}

\item{mean, sd}{Parameters for normal random variables.}

\item{seed}{Seed for the random number generation.}

\item{type}{'double' or 'float'}
}
\description{
Generate from a normal distribution using a gpu.
}
\details{
Uses \code{curand_normal()} from cuRAND.
}
\references{
CUDA Toolkit Documentation for cuRAND
\url{https://docs.nvidia.com/cuda/curand/index.html}
}

