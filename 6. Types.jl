# In this moment you know a little about types in Julia because we used 
# typeof() fuction in first chapter.

typeof(1) # => Int64

#******************************************************************************#
#                               6.1 Concrete types                             #
#******************************************************************************#

# Users can define types
# They are like records or structs in other languages.
# New types are defined using the `type` keyword.

# type Name
#   field::OptionalType
#   ...
# end

type Cat
  taillength::Float64
  coatcolor 
end

lion = Cat(4,"orange") 
typeof(lion) # => Cat

# You can declare new variable of type Cat using another variable of this type:
tiger = typeof(lion)(3.5, "orange")
typeof(tiger) # => Cat

#******************************************************************************#
#                               6.2 Abstract types                             #
#******************************************************************************#

# This kind of types could have subtypes.

abstract Dog

# Abstract types can't be instantied.
# This types has got supertype.
# For example we use abstract class Number.

subtypes(Number)
super(Number) # => Any because Number is supertype
super(Real)

# To define new abstract type as subtype use "<:" operator:
type Doggy <: Dog
    eye_color
    Doggy() = new("brown")
end
# In this example we used constructor. Constructors gives for you contorl over
# how values of the type can be created.
# You should use outer constructors rather than inner.

woofer = Doggy() # => Doggy("brown")

# More about types you can read in Julia manual:
# http://docs.julialang.org/en/release-0.5/manual/types/