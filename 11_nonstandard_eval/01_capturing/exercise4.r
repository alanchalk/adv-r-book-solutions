### f(), defined above, just calls substitute(). Why can’t we use it to define g()?
### In other words, what will the following code return? First make a prediction.
### Then run the code and think about the results.

# Recall that `substitute` is literal, so `substitute(x)` is always "x".
# Therefore you cannot pass x from the function into `substitute`,
# since the output will always be "x".

f <- function(x) substitute(x)
g <- function(x) deparse(f(x))
g(1:10)
# [1] "x"
g(x)
# [1] "x"
g(x + y ^ 2 / z + exp(a * sin(b)))
# [1] "x"

# Above explanation can be extended, since the answer given that `substitute(x)` is always "x"
# is not so clear.  For example....
# First, note:
g1 <- function(x) deparse(substitute(x))

# does work as expected
g1(1:10)
# [1] "1:10"

# We can see a little more what is going on by adding a print statement to f
f <- function(x) {
    print(paste("function f returns: ", deparse(substitute(x))))
    substitute(x)}
g <- function(x) {
    deparse(f(x))}

f(1:10)
# [1] "function f returns:  1:10"
# 1:10
# so when just calling f, returns 1:10
# However when calling f from within g....
g(1:10)
# "function f returns:  x"
# [1] "x"
# by the time we call f, it is not able to return 1:10.

# Just maybe to confuse things a bit more
g2 <- function(x) {
    substitute(x) %>% deparse()}
g2(1:10)
[1] "1:10"
g2(x + y ^ 2 / z + exp(a * sin(b)))
# [1] "x + y^2/z + exp(a * sin(b))"

# I'm actually not sure what the asnwer is, I think it is to do with what the promise is within each function.
# When just calling only f, the promise is made up of an expression which is 1:10 and an environment to evaluate it
# The same is true when we use the chain iterator within g.  
# However i think when we call f(x) from within g, then moving to a different environment is causing the different behaviour,
# though I do not understand why.  I think maybe, the promise gets evaluated and looses the expression that used to go with it...?





