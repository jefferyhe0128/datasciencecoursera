## Data Science (Johns Hopkins University)

## R Programming

## Programming Assignment 2

## Assignment: Caching the Inverse of a Matrix

## makeCacheMatrix creates a special "matrix", which is really a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse of the matrix
## 4. get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    y <- NULL
    setMatrix <- function(z) {
        x <<- z
        y <<- NULL
    }
    getMatrix <- function() {
        x
    }
    setInverseMatrix <- function(z) {
        y <<- z
    }
    getInverseMatrix <- function() {
        y
    }
    list(setMatrix = setMatrix,
         getMatrix = getMatrix,
         setInverseMatrix = setInverseMatrix,
         getInverseMatrix = getInverseMatrix)
}

## cacheSolve calculates the inverse of the special "matrix" created with makeCacheMatrix

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    y <- x$getInverseMatrix()
    if(!is.null(y)) {
        message("getting cached data")
        return(y)
    }
    z <- x$getMatrix()
    y <- solve(z)
    x$setInverseMatrix(y)
    y
}

## test with a simple matrix
## A <- matrix(c(1,3,3,1), nrow = 2, ncol = 2)
## B <- makeCacheMatrix(A)
## cacheSolve(B)
## cacheSolve(B)
