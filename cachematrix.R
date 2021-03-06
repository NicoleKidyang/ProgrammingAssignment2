## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache 
## its inverse

makeCacheMatrix <- function(x = matrix()) {
              inverse <- NULL
              set <- function(y){
                  x <- y
                  inverse <<- NULL
              }
              get <- function() x
              setinverse <- function(inversedMatrix) inverse <<- inversedMatrix
              getinverse <- function() inverse
              list(set = set, get = get, setinverse = setinverse,
                   getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already 
## been calculated (and the matrix has not changed), then the 
## cachesolve should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getinverse()
        data <- x$get()
        if(!is.null(inverse) && (data == x)){
          message("getting cached data")
          return(inverse)
        }
        inverse <- solve(data, ...)
        x$setinverse(inverse)
        inverse
}
