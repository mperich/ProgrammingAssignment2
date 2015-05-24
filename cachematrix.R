##Provides functions to construct an object that can be used to invert a matrix and cache the result
##for future retrieval

##Constructs a CacheMatrix object that can solve/cache the inverse of a matrix and also get/set the
##value of the matrix

makeCacheMatrix <- function(x = matrix()) {
      
      inv <- NULL
      
      get <- function() x
      set <- function(y) 
      {
            x <<- y
            inv <<- NULL
      }
      
      getInverse <- function()
      {
            if (is.null(inv))
            {
                  inv <<- solve(x)
            }
            
            inv
                
            
      }
            
      
      invisible(list(set = set, get = get, getInverse = getInverse))
           
}


## Wrapper function for x[getInverse]. Returns the inverse of x (using a cached result if applicable)

cacheSolve <- function(x, ...) {
       
      x$getInverse()
      
}
