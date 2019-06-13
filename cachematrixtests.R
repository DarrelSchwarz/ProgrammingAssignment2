## Test 1
mcm <- makeCacheMatrix()    # setup the cachematrix function
mcm$get()                   # retrieve the matrix which will return NA as no matrix is currently cached
mcm$getsolve()              # retrieve the value of s, which should be NULL
cacheSolve(mcm)             # prints "calculating" (as s was null) and returns NA
cacheSolve(mcm)             # prints "getting cached data" as s has been calculated and returns NA

## Test 2
z<- matrix(rnorm(4),2,2)    # create a matrix
z                            
mcm <- makeCacheMatrix(z)   # setup a new cachematrix function passing in matrix z
mcm$get()                   # retrieve the matrix which should be same as z
mcm$getsolve()              # retrieve the value of s, which should be NULL as the inverse hasn't been calculated yet
cacheSolve(mcm)             # prints "calculating" (as s was null) and returns the inverse
cacheSolve(mcm)             # prints "getting cached data" as s has been calculated and returns the inverse
cacheSolve(mcm) == solve(z)   # Used to confirm that the correct inverse was returned 

## Test 3
mcm$set(matrix(rnorm(4),2,2)) # reset value with a new matrix
mcm$get()                   # retrieve the matrix 
mcm$getsolve()              # retrieve the value of s, which should be NULL
cacheSolve(mcm)             # prints "calculating" (as s was null) and returns the inverse
cacheSolve(mcm)             # prints "getting cached data" as s has been calculated and returns the inverse
cacheSolve(mcm) == solve(mcm$get())   # Used to confirm that the correct inverse was returned 

