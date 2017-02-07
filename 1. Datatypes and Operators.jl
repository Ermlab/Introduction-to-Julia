#******************************************************************************#
#                               1.1 Comments                                   #
#******************************************************************************#

# This is a single line comment

#=  To do multiline comments you should start with '#='
    and end with '=#'.
    This comments can also be nested.
=#

#******************************************************************************#
#                               1.2 Datatypes                                  #
#******************************************************************************#

# In Julia there are several types of data:
println("3 => ", typeof(3)) # 3 => Int64
println("3.2 => ", typeof(3.2)) # 3.2 => Float64
println("2 + 1im => ", typeof(2 + 1im)) # 2 + 1im => Complex{Int64}
println("4//5 => ", typeof(4//5)) # 4//5 => Rational{Int64}
println("[1,2,3] => ", typeof([1,2,3])) # [1,2,3] => Array{Int64,1}}
println("Some text => ", typeof("Something")) # Some text => ASCIIString
println("a (as character) => ", typeof('a')) # Character => Char

# As you can see to check type of data you can use typeof() funcion.
# To print something use print()
# or println() when you need to print something in new line

#******************************************************************************#
#                           1.3 More about strings                             #
#******************************************************************************#

# You can create string using " symbol (e.g. "Some text").
# Note that u must use ' symbols (e.g. 'a') to create character literals.

# Some strings can be indexed like an array of characters:
println("This is a string"[1]) # => 'T'
# Note that Julia indexes from 1.
# However, this is will not work well for UTF8 strings,
# so iterating over strings are recommended.

# $ symbol can be used to string interpolation:
println("2+2=$(2+2)") # => 2+2=4

# If you want to format string you can use @printf macro:
@printf "%d is less than %f \n" 5.6 5.2 # => 6 is less than 5.200000 
# You can use \n in string to start writing in next line

# Strings can be compared lexicographically:
println("good" > "bad") # => true
println("good" == "bad") # => false
println("2+2=4" == "2+2=$(2+2)") # => true

#******************************************************************************#
#                               1.4 Operators                                  #
#******************************************************************************#

# In Julia you can use all normal operators:
println(1+1) # => 2
println(3-1) # => 2
println(2*3) # => 6
println(6/2) # => 3.0 It's always float! 
# To get truncated result of dividing use div() function as show below 
println(div(7,2)) # => 3
# Come back to operators
println(7\28) # => 4
println(2^8) # => 256
println(13%10) # => 3

# Ofcourse you can enforce precedence with parentheses
println((1+1)*2) # => 4

#******************************************************************************#
#                           1.5 Bitwise operators                              #
#******************************************************************************#

println(~1) # => 3, bitwise not
println(5 & 3) # => 1, bitwise and
println(5 | 3) # => 7, bitwise or
println(5 $ 3) # => 6, bitwise xor
println(5 >>> 3) # => 0, logical shift right
println(5 >> 3) # => 0, arithmetic shift right
println(5 << 3) # => 40, logical/arithmetic shift left

# To see binary representation of number you can use bits() function:
println(bits(128))
    # => 0000000000000000000000000000000000000000000000000000000010000000
println(bits(128.0))
    # => 0100000001100000000000000000000000000000000000000000000000000000

# Boolean values without any changes:
println(true == 1) # => true
println(false == 0) # => true

# Booleand operators too:
println(!false) # => true
println(1 == 1) # => true
println(1 != 1) # => false
println(1 < 2) # => true
println(1 > 2) # => false
println(2 <= 2) # => true
println(2 >= 2) # => true

# Comparisons can be chained:
println(1 < 2 < 3) # => true
println(1 < 2 < 1) # => false