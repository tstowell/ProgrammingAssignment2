## 2014-08-22 / jts

## This R language file contains a pair of functions for storing matrices, calculating
## the inverse of those matrices, and caching the calculated inverse in order to 
## speed processing time.


##  Store a matrix and its cached inverse.

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL 
    set <- function(y) {
             x <<- y
       inverse <<- NULL  # we have a new matrix, so our cached inverse is now invalid
    }
    get <- function() x 
    setinverse <- function(inverse) inverse <<- inverse
    getinverse <- function() inverse
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
   
}


## Calcuate the inverse on a cached matrix (created by makeCacheMatrix above),
## and cache the result for possible future use.

cacheSolve <- function(x, ...) {
    inverse <- x$getinverse()
    if(!is.null(inverse)) {
        message("retrieving cached inverse")
        return(inverse)
    }
    x$setinverse(solve(x$get()))
    x$getinverse()

}
