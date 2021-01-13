## functions do


makeCacheMatrix <- function(x = matrix()) {
}

##ANSWER
#Week 3 R programming Assignment 2 - Lexical Scoping by nkrbt106
#Based on the examples of caching a mean of a vector, the task is to..
#..cache the inverse of a matrix

##ANSWER
#1st function - makeCacheMatrix function is to create a special 'matrix' object
#..for caching its inverse
#This makeCacheMatrix function consists of 4 functions 'set', 'get',.. 
#..'setInverse' and 'getInverse' with object 'x' and 'k'

makeCacheMatrix <- function(x = matrix()) {       ##to define the 'matrix' argument by initializing object 'x' and later 'k'
  k <- NULL                                       ##set k to NULL to be used in later code
  set <- function(y){                             ##define the 'set' function
    x <<- y                                       ##value of x in parent environment
    k <<- NULL                                    ##value of k in parent environment, reset to NULL
  }
  get <- function()x                              ##define 'get' function for returning the matrix argument
  setInverse <- function(inverse) k <<- inverse   ##define 'setInverse' function, with k value in its parent environment
  getInverse <- function() k                      ##define 'getInverse' function
  list(set = set, get = get,                      ##list is created to give names to the 4 functions, which is important for..
       setInverse = setInverse,                   ##..using $ command in cacheSolve later
       getInverse = getInverse)
}


cacheSolve <- function(x, ...) {
}

##ANSWER
#2nd function - cacheSolve function is to compute the inverse of the special.. 
#..matrix by makeCacheMatrix, if the function is not in inverse, assuming the 
#..matrix given is invertible
#using a solve() function to to return its inverse

cacheSolve <- function(x, ...) {     
  ## Return a matrix that is the inverse of 'x'
  k <- x$getInverse()                ##attempt to retrieve an inverse from object 'x' 
  if(!is.null(k)){                   ##this serves as 'if k value is not equal to NULL, to return a valid cache k value..
    message("getting cached data")   ##..in parent environment instead'
    return(k)
  }
  data <- x$get()                   ##if !is.null(k) is FALSE then cacheSolve gets the matrix from input object..
  k <- solve(data, ...)             ##..to calculate the inverse of matrix
  x$setInverse(k)                   ##use setInverse here to set the value of inverse matrix to the parent environment
  k                                 
}

