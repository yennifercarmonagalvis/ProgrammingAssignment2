## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { ## define the argument with default mode of "matrix"
  inv <- NULL   ## initialize inv as NULL; will hold value of matrix inverse 
  set<- function(y) { ## define the set function to assign new 
    x <<- y ## value of matrix in parent environment
    inv <<-NULL    ## if there is a new matrix, reset inv to NULL
  }
  get <- function() {x}  ## define the get funtion - returns value of the matrix argument
  setInverse <- function(inverse) {inv <<- inverse}  ## assigns value of inv in parent environment
  getInverse <- function() {inv}
  list(set = set, get = get, setInverse = setinverse, getinverse = getInverse)
  ## you need this in order to refer 
  
  ## to the functions with the $ operator

}

## Write a short comment describing this function

cacheSolve <- function(x, ...) { ## Return a matrix that is the inverse of 'x'
    inv <- x$getInverse()
    if(!is.null(inv)){
      message("getting cached data")
      return(inv)
    }
    mat <- x$get()
    inv <- solve(mat, ...)
    x$setInverse(inv)
    inv
}
