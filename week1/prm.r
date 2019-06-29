allPrime <- function(n) {
  primes <- rep(TRUE, n)
  primes[1] <- FALSE
  for (i in 1:sqrt(n)) {
    if (primes[i]) primes[seq(i^2, n, i)] <- FALSE
  }
  which(primes)
}