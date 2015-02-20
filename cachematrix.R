## These functions provide a way to cache the inverse of 
## a matrix so that it does not need to be computed repeatedly

## This function creates a special "matrix" object
##  that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
	# Sanity check the input
	if (!is.matrix(x)) {
	   stop("Input is not a valid matrix")
	}

	inverse <- NULL
	set <- function(y) {
	    x <<- y
	    inverse <<- NULL
	}
	get <- function() x
	setInverse <- function(matInv) inverse <<- matInv
	getInverse <- function() inverse
	list(set = set, get = get, 
		 setInverse = setInverse,
		 getInverse = getInverse)
}


## This function computes the inverse of the special 
##  "matrix" returned by makeCacheMatrix above. If the 
##  inverse has already been calculated (and the matrix 
##  has not changed), then the cachesolve should retrieve 
##  the inverse from the cache

cacheSolve <- function(x, ...) {

        ## Return a matrix that is the inverse of 'x'
	inverse <- x$getInverse()
	## Check for a cached inverse
	if(!is.null(inverse)){
		message("getting cached data")
		return(m)
	}

	# There is no cache available, so solve inverse
	data <- x$get()
	inverse <- solve(data, ...)
	x$setInverse(inverse)
	inverse
}
