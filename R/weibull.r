#' curand_weibull
#' 
#' Generate from a weibull distribution using a gpu.
#' 
#' @param n 
#' The number of values to generate
#' @param mean,sd 
#' Parameters for weibull random variables.
#' @param seed 
#' Seed for the random number generation.
#' @param type
#' 'double' or 'float'
#' 
#' @references Rizzo, M.L., 2007. Statistical computing with R. Chapman and
#' Hall/CRC.
#' 
#' @useDynLib curand R_curand_weibull
#' @export
curand_weibull = function(n, shape, scale=1, seed=getseed(), type="double")
{
  type = match.arg(tolower(type), c("double", "float"))
  type = ifelse(type == "double", TYPE_DOUBLE, TYPE_FLOAT)
  
  if (n < 0)
    stop("invalid arguments")
  else if (n == 0)
  {
    if (type == TYPE_DOUBLE)
      return(numeric(0))
    else
      return(float(0))
  }
  
  n1 = floor(sqrt(n))
  n2 = n - n1*n1
  
  if (shape < 0 || scale < 0 || is.badval(shape) || is.badval(scale))
  {
    warning("NAs produced")
    ret = setnan(n1, n2, type)
  }
  else
    ret = .Call(R_curand_weibull, as.integer(n1), as.integer(n2), as.double(shape), as.double(scale), as.integer(seed), type)
  
  if (type == TYPE_DOUBLE)
    ret
  else
    float32(ret)
}