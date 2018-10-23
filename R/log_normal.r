#' curand_log_normal
#' 
#' Generate from a normal distribution using a gpu.
#' 
#' @param n 
#' The number of values to generate
#' @param mean,sd 
#' Parameters for normal random variables.
#' @param seed 
#' Seed for the random number generation.
#' @param type
#' 'double' or 'float'
#' 
#' @useDynLib curand R_curand_log_normal
#' @export
curand_log_normal <- function(n, meanlog=0, sdlog=1, seed=getseed(), type="double")
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
  
  if (sdlog < 0 || is.badval(meanlog) || is.badval(sdlog))
  {
    warning("NAs produced")
    ret = setnan(n1, n2, type)
  }
  else
    ret = .Call(R_curand_log_normal, as.integer(n1), as.integer(n2), as.double(meanlog), as.double(sdlog), as.integer(seed), type)
  
  if (type == TYPE_DOUBLE)
    ret
  else
    float32(ret)
}