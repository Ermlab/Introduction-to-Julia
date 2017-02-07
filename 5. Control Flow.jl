# In this chapter we stop to writing console output in comments.
# To see result of action select it and click on run selection button.

#******************************************************************************#
#                               5.1 Begin and (;)                              #
#******************************************************************************#

# Sometimes you can need expression which evaluates several subexpressions.
# For this you can use begin blocks and (;) chains.

expression = begin
    x =1
    y = 2
    z = 3
    x + y + z
end

expression = (x =1; y = 2; z = 3; x + y + z)

#******************************************************************************#
#                               5.2 If statement                               #
#******************************************************************************#

var = 5

if var > 5
    println("var is bigger than 5")
elseif var < 5
    println("var is smaller than 5")
else
    println("var is indeed 5")
end
# This statement prints "var is indeed 5".

# Also you can use shorter version of if, 
# but it's only for statements if -> else

# condition?action_for_true:action_for_false

var==5?println("var = 5"):println("var != 5")

# And you can nest this statements:

x = 1
y = 3
println(x < y ? "x is less than y"    :
                            x > y ? "x is greater than y" : "x is equal to y")

#******************************************************************************#
#                               5.3 For loop                                   #
#******************************************************************************#

# This loop iterate over iteretables.

for fruit=["apple", "cherry", "peach"]
    println("$fruit")
end
# You can use "in" instead of "=":
for number in [1:5;]
    println("$number")
end

# For loop can iterate over Range, Array, Set, Dict and AbstractString

for dict in Dict("apple" => "green", "cherry" => "red", "peach" => "orange")
    println("$(dict[1]) is $(dict[2])")
end
# You can write it another:
for (x,y) in Dict("apple" => "green", "cherry" => "red", "peach" => "orange")
    println("$x is $y")
end

#******************************************************************************#
#                               5.4 While loop                                 #
#******************************************************************************#

# This loop loops while condition is true.
# e.g. while(true) loops to infinity.

var = 1
while var < 10
    println(var)
    var += 1
end

#******************************************************************************#
#                           5.4 Try-catch statement                            #
#******************************************************************************#

# Try-catch statement helps us when we want to handle errors.

try
    something_wrong
catch e
    println(e) 
end

#******************************************************************************#
#                               5.4 Finally clauses                            #
#******************************************************************************#

# When you start to working with files you propably want to easy close file
# after operations. You can do it with finally keyword
#
# try
#   operations
# finally
#   operations after try block
# end


#******************************************************************************#
#                                  Conclusion                                  #
#******************************************************************************#

# You can nest if statement, for lopps and while loops:
var = 5
while var >= 0
    for (x,y) in Dict("apple" => "green", "cherry" => "red", "peach" => "orange")
        if var > 0
            if var > 1
                println("$x is $y")
            end
        end
    end
    println()
    var -= 1
end

# This example only shows how you can do it. Don't coding like this!
# It's better to write short and optimalized code

# You can read more about control flow on: 
# http://docs.julialang.org/en/release-0.5/manual/control-flow/

# There you can find more details about things from this chapter and 
# more useful things (e.g. tasks, events).