#******************************************************************************#
#                              4.1 Declaration                                 #
#******************************************************************************#

# To declare function use this schema: 
# function name(argument, argument, ...)
#   function body
# end

function sum(a, b)
    a + b
end

# Functions always returns value of their last statement
# unless you use return keyword.

function abs_sub(a, b)
    if a < b
        return b - a
    end
    a - b
end
println(sum(3,2))

# To call the function use function name.
# If you want to see function result just print it.

println(sum(3,2))

# As you can see we used values as arguments.

# For simple functions you can use shorter declaration:

f_sum(x, y) = x + y
println(f_sum(3,2))

# Functions can return multiple values as tuple:

f(x, y) = x + y, x - y
println(f(3,2))

# You can create function copies usign function object:

g = f
println(g(3,2))

# Unicode symbols can be functions name:

∑(x,y) = x + y
println(∑(1,2))

#******************************************************************************#
#                         4.2 Operators are functions                          #
#******************************************************************************#

# Most operators in Julia can be use as functions.

println(+(1,2,3))
s = +
println(s(1,2,3))

# Pretty nice, right?

# There are a few function that can be call using symbols.
# You can find it on this website: https://goo.gl/DJIvrE


#******************************************************************************#
#                           4.3 Anonymous functions                            #
#******************************************************************************#

# In some situations you need function that be used only once.
# For this you can use function without name.
# You can use it to pass function as another function argument.

function (x)
    x^2 + 2x -1
end

map(x -> x^2 + 2x - 1, [1,3,-1])

# In this step you know that this fuctions are same.
# For this example we used map() function, which applies a function to each 
# value of an array and returns a new array containing the resulting values.

#******************************************************************************#
#                           4.4 Varargs functions                              #
#******************************************************************************#

# Varargs is short for "variable number of arguments".
# This feature is useful when you need a function without specific number
# of arguments.

bar(a,b,x...) = (a,b,x)
bar(1,2,3,4,5,6,7)

# The a and b variables are bound to first two arguments and the x variable is 
# bound to rest

x = (1,2,3,4)
bar(x...)

# Did you see it? You don't need give all arguments for this function.

#******************************************************************************#
#                           4.5 Optional arguments                             #
#******************************************************************************#

# Functions with optional arguments are useful when you want to use default 
# value if argument doesn't passed into function.

function optional_args(x,y,z=100)
    x+y+z
end

println(optional_args(1,2,3))
println(optional_args(1,2))

# In second call we don't specified third argument and it take default value.

#******************************************************************************#
#                           4.6 Do-Block Syntax                                #
#******************************************************************************#

# You can pass functions to other function as argument. It's powerful texhnique,
# but the syntax for it isn't always convenient.
# For these Julia has special keyword "do":

map([A, B, C]) do x
    if x < 0 && iseven(x)
        return 0
    elseif x == 0
        return 1
    else
        return x
    end
end

# This syntax creates an anonymous function with argument x and passed it as the
# first argument to map().

#******************************************************************************#
#                                   Conclusion                                 #
#******************************************************************************#

# You can read more about functions in Julia manual: 
# http://docs.julialang.org/en/release-0.4/manual/functions/

























