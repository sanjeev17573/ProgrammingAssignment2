
## Creates a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {


## Initialize the inverse property
n <- NULL

## set the matrix
set <- function( matrix ) {
  l <<- matrix
  n <<- NULL
}

##  get the matrix
get <- function() {
  ## Return the matrix
  l
}

## set the inverse of the matrix
setInverse <- function(inverse) {
  n <<- inverse
}

##  get the inverse of the matrix
getInverse <- function() {
  ## Return the inverse property
 n
}

## Return a list of the methods
list(set = set, get = get,
     setInverse = setInverse,
     getInverse = getInverse)
}


## Compute the inverse of the special matrix returned by "makeCacheMatrix"

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  l <- x$getInverse()
  
  ## Just return the inverse if its already set
  if( !is.null(l) ) {
    message("getting cached data")
    return(l)
  }
  
  ## Get the matrix from our object
  data <- x$get()
  
  ## Calculate the inverse using matrix multiplication
  l <- solve(data) %*% data
  
  ## Set the inverse to the object
  x$setInverse(l)
  
  ## Return the matrix
l
}
