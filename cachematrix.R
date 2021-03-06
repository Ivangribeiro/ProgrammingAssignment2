## This functions work to deal better with time-consuming computations.

## makeCacheMatrix function creates a special "matrix" object that can cache its inverse.
#1.  set the value of the matrix
#2.  get the value of the matrix
#3.  set the value of the inverse
#4.  get the value of the inverse Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

    i <- NULL
    set <- function(y) {
      x <<- y
      i <<- NULL
    }
    get <- function() x
    setinv <- function(solve) i <<- solve
    getinv <- function() i
    list(set = set, get = get, setinv = setinv, getinv = getinv)
 
}

## cacheSolve function computes the inverse of the matrix created by makeCacheMatrix function. 
# It checks if the mean has already been calculated. If so, it skips the computation.

cachesolve <- function(x, ...) { 
    i<- x$getinv()
    if(!is.null(i)) {
      message("getting cached data")
      return(i)
    }
    data <- x$get()
    i<- solve(data, ...)
    x$setinv(i)
    i

}

w <- matrix(c(1,0,4,6,1,8,3,2,0,6,8,3,5,2,6,1),nrow = 4,ncol = 4)
Z <- makeCacheMatrix(w)
cachesolve(z)
}
