## R Programming assignment 2 required us to write a pair of functions that cache the inverse of a matrix.
## Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix
## rather than computing it repeatedly. The script below is a pair of functions that cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL              ## i is set to null as a reset value - in case the matrix has changed.
  set <- function(y) {   ## set will clear the cache should the value of x change. 
    x <<- y
    i <<- NULL
  }                      
  get <- function() x    ## returns the matrix x
  setinvertmatrix <- function(solve) i <<- solve  ## i is set to calculate solve
  getinvertmatrix <- function() i ## to return the inverted matrix
  list (set = set, get = get, setinvertmatrix = setinvertmatrix, 
        getinvertmatrix = getinvertmatrix) ## This returns the functions set within makeMatrix
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has 
## already been calculated (and the matrix has not changed), then this function retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
  i <- x$getinvertmatrix()         ## Sets i to return getinvertmatrix as defined above 
  if(!is.null(i)) {                ## If i is not null it will 'get cached data' and return the i value 
    message("getting cached data") ## otherwise it will proceed to calculate below.
    return(i)               
  }
  data <- x$get()           ## data is defined as the matrix x
  i <- solve(data)          ## Calculates the inverse of the Matrix x
  x$setinvertmatrix(i)      ## set the value of i in the setinvertmatrix variable (so can be retieved from cache later)
  i                         ## Returns i - the inverse of the Matrix x
}
