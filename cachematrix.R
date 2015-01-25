## R Programming assignment 2 required us to write a pair of functions that cache the inverse of a matrix.
## Given Matrix inversion can be costly the instend of these functions is to speed up the process.
## The two statements below work as follows: makeCacheMatrix creates a matrix and it's inverse, which 
## can then be called by casheSolve when needed. 

## This first function creates "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  b <<- matrix(1:4,2,2)
  solve(b)
}


## This function computes the inverse of the "matrix" returned by makeCacheMatrix above. If the inverse has 
## already been calculated (and the matrix has not changed), then this function retrieves the inverse 
## from the cache.

cacheSolve <- function(x, ...) {
  z <<- makematrixprac()
  if(!is.null(z)) {
    message("getting cached data")
    return(z)
  }
}
