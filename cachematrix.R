## Same as in the example, but here the four functions set the matrix, get the matrix previously set if any,
## set the inverse and get the inverse if previously set

makeCacheMatrix <- function(x = matrix()) {
 m <- NULL
        set <- function(y=matrix()) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(inv=matrix()) m <<- inv
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


## This one gets the inverse if previously set, or else calculates it using solve

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        m <- solve(x$get())
        x$setinv(m)
        m
}
