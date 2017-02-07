#******************************************************************************#
#                           2.1 Declaring variables                            #
#******************************************************************************#

# When you declaring variables you must initialize it:
variable = 2
println(variable) # => 2

# If you try to declare variable without initializing you get an error:
try
    other_variable
catch e
    println(e) # => UndefVarError(:other_variable)
end
# In this example we used try-catch block. It's very easy way to handle errors.

# Variables names must start with a letter or undersore.
# But after you write first character of your variable name,
# you can start to use all symbols.

# You can also use unicode characters as name of your variable:
☃ = 8
println(☃) # => 8
# And it easy to use mathematical notation:
println(2 * π) # => 6.283185307179586

# At end of this section you'll meet with naming conventions in Julia.
#
# 1. You can indicated word separation in variable name with the underscores.
# 2. Names of Types begin with capital letter and word separation is shown with
#    CamelCase.
# 3. Names of functions and macros are in lower case without underscores.
# 4. Functions that modify their inputs have names that end in !. These
#    functions are sometimes called mutating functions or in-place functions.

#******************************************************************************#
#                                   2.2 Arrays                                 #
#******************************************************************************#

# Arrays are indexed from 1 and can store a seqence of values.
a = Int64[] # It's empty Int64 array

# 1-dimensional arrays can be initialized with values separated by commas or 
# semicolons:
comma_array = [3, 2, 1] # 3-element Array{Int64,1}: [1,2,3]
println(comma_array) # => [1, 2, 3]
semicolon_array = [1; 2; 3] # 3-element Array{Int64,1}: [1,2,3]
println(semicolon_array) # => [1, 2, 3]

# Also you can use arrays of specific types:
int8_array = Int8[1, 2, 3] # 3-element Array{Int8,1}: [1,2,3]
character_array = ['a', 'b', 'c'] # 3-element Array{Char,1}: ['a', 'b', 'c']

# You can check what value is under concrete index (remember that we have 
# declared arrays):
println(comma_array[1]) # => 3
println(comma_array[end]) # => 1

# To declare multidimensional array use space-separated values and 
# semicolon-separated rows:
matrix = [1 2; 3 4; 5 6] # 3x2 Array{Int64,2}: [1 2; 3 4; 5 6]

# You can add values to the end of array with push!() and append!():
a = Int64[]
push!(a,1) # [1]
push!(a,2) # [1, 2]
push!(a,3,4,5) # [1, 2, 3, 4, 5]
append!(a, comma_array) # [1, 2, 3, 4, 5, 3, 2, 1]

# To remove value from end use pop!:
pop!(a)
println(a) # => [1, 2, 3, 4, 5, 3, 2]

# To add or remove value from begin of array use unshift!() and shift!():
unshift!(a,2)
println(a) # => [2, 1, 2, 3, 4, 5, 3, 2]
shift!(a)
println(a) # => [1, 2, 3, 4, 5, 3, 2]

# To remove elements from an array by index use splice!():
splice!(a,3) 
println(a) # => [1, 2, 3, 3, 4, 5]

# To sort arrays use sort!():
sort!(a)
println(a) # => [1, 2, 3, 3, 4, 5]

# Arrays can be initialized from ranges:
array = [1:5;6:9]
println(array) # => [1, 2, 3, 4, 5, 6, 7, 8, 9]

# You can look at ranges with slice syntax:
println(array[1:3]) # => [1, 2, 3]
println(array[4:end]) # => [4, 5, 6, 7, 8, 9]

# in() function help you to check if specified element existence array:
println(in(2,array)) # => true

# To check array length use length() function:
println(length(array)) # => 9

#******************************************************************************#
#                               2.3 Tuples                                     #
#******************************************************************************#

# Declaration:
tup = (1, 2, 3)
println(tup, " of type: ",typeof(tup)) # => (1,2,3) of type: 
#                                           Tuple{Int64,Int64,Int64}
# You can leave parentheses:
tup = 1, 2, 3
println(tup, " of type: ",typeof(tup)) # => (1,2,3) of type: 
#                                           Tuple{Int64,Int64,Int64}

# Tuples are immutable:
println(tup[1]) # => 1
try:
    tup[1] = 3 # Try to overwrite value
catch e
    println(e) # => MethodError (setindex!,(:tup,3,1))
end

# Many array function works well on tuples:
println(length(tup)) # => 3
println(tup[1:2]) # => (1,2)
println(in(2, tup)) # => true

# Tuples can be unpack and save into variables:
var1, var2, var3 = (1, 2, 3)
println(var1," ",var2," ",var3) # => 1 2 3

# You can easily swap few variables
var1, var2, var3 = var3, var2, var1
println(var1," ",var2," ",var3) # => 3 2 1

#******************************************************************************#
#                      2.4 Dictionaries store mappings                         #
#******************************************************************************#

# To declaration use Dict() function:
empty_dict = Dict() # => Dict{Any,Any} with 0 entries
filled_dict = Dict("one"=> 1, "two"=> 2, "three"=> 3)
println(filled_dict) # => Dict("two"=>2,"one"=>1,"three"=>3)
# As you can see dictionary keys are not sorted. 
println(typeof(filled_dict)) # => Dict{ASCIIString,Int64}

# Look up values with []:
println(filled_dict["two"]) # => 2

# To get all keys use keys() function:
println(keys(filled_dict)) # => ASCIIString["two","one","three"]

# To get all values use values() function:
println(values(filled_dict)) # => [2,1,3]

# To check for existence of keys in dictionary you can use in() and haskey():
println(in(("one" => 1), filled_dict)) # => true
println(haskey(filled_dict, "one")) # => true
println(haskey(filled_dict, 1)) # => false

# Function get() is usign to assign default value for no mapping key.
# If key is mapping, get() return value stored for the given key.
# This function will be helpful if you want to avoid key not found error.
get(filled_dict,"two",4) # 2
get(filled_dict,"four",4) # 4

#******************************************************************************#
#                                   2.5 Sets                                   #
#******************************************************************************#

# Sets are useful to represent collections of unordered and unique values.

# Declaration:
empty_set = Set()
println(empty_set) # => Set{Any}()
filled_set = Set([1,2,3,3,4])
println(filled_set) # => Set([4,2,3,1])

# Checking that values existance in the set:
println(in(1, filled_set)) # => true

# Add values to the set:
push!(filled_set, 8)
println(filled_set) # => Set([4,2,3,8,1])

# There are functions for set intersection, union, and difference:
other_set = Set([5, 6, 7, 8])
intersect(filled_set, other_set) # => Set([8])
union(filled_set, other_set) # => Set([7,4,2,3,8,5,6,1])
setdiff(filled_set, other_set) # => Set([4,2,3,1])

#******************************************************************************#
#                               Conclusion                                     #
#******************************************************************************#

# Functions with ! symbol (e.g. pop!(), push!(), sort!()) can modify their
# argument. You can use sort() function to sort an array but result don't be 
# saved.

# You can declare array like this: a = []. In result you get array of type Any
# and put there values of different types.

# In Julia manual you can find many useful functions to operating on arrays:
# http://docs.julialang.org/en/release-0.5/stdlib/arrays/