# The following functions will create a special vector. 
# If inverse is already present, it will get the data from the cache or else it will find the inverse an store it in cache.

## The first function is used to set a value to the matrix
makeCache_Matrix <- function(x = matrix()) {
            z <- NULL
            set <- function(y) {
              x <<- y
              z <<- NULL
              }
            
## This function is used to get the value of the matrix         
get <- function() x
## This function is used to set the value of the inverse
setinverse <- function(inverse) z <<- inverse
## This function is used to get the value of the inverse
getinverse <- function() z
list(set = set, get = get,
                 setinverse = setinverse,
                 getinverse = getinverse)
            
}


## The following function will get the inverse of the special character
cacheSolve <- function(x, ...) {
      z <- x$getinverse()
      if(!is.null(z)) {
          message("Please wait...Getting the cached data")
          return(z)
  }
  data <- x$get()
  z <- solve(data, ...)
  x$setinverse(z)
  z
}

#Testing the above functions : 
Mat <- matrix(c(3,4,5,6),2,2)
M <- makeCache_Matrix(Mat)
cacheSolve(M) # This cacheSolve will actually provide us the inverse from the cache
