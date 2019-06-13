## These functions provide a caching service for a matrix and its inverse.
##
##      maketCacheMatrix() sets up a new cache object
##      cacheSolve() returns the inverse of the cached matrix (only does inverse calculation once)   
##


##
## The makeCacheMatrix function provides an object to cache a matrix and its inverse.
## The methods are
##  set() - used to cache a matrix 
##  get() - used to retrieve the matrix from the cache
##  setsolve() - used to set the inverse of the matrix
##  getsolve() - used to retreive the inverse of the matrix from the cache
##
makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) s <<- solve
        getsolve <- function() s
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
    
}

##
## The cacheSolve function will return the inverse of the matrix in the makeCacheMatrix object.  
## For a new cached matrix it will calculate the inverse, cache the result and then return the inverse.
## All subsequent calls for the same cached matrix will then just return the inverse from the cache.
##
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        s <- x$getsolve()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        message("calculating")
        data <- x$get()
        s <- solve(data)
        x$setsolve(s)
        s
}