## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## The following functions implement cached matrix inverse. It uses
## R's solve function which takes a matrix X and returns inverse of the ## matrix. It has not been tested for singular matrices.

## Matrix caching first - 
## x - List that contains get,set,getInverse and setInverse functions

makeCacheMatrix <- function(x = numeric()) {
        m <- NULL

## Define set and get functions

        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x

## setInverse - creates and stores matrix inverse
## getInverse - Retrieves cached matrix

        setInverse <- function(inverse) m <<- solve(x)
        getInverse <- function() m
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## Write a short comment describing this function
## Following function when called, returns inverse of a matrix from 
## either a cache or by solving first time if not available in cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m <- x$getInverse()

## Check if available in cache

        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()

## If not, solve and get

        m <- solve(data, ...)
        x$setInverse(m)
        m
}
