# In Julia, all named functions are generic functions.
# This means that they are built up from many small methods.
# Each constructor for Lion is a method of the generic function Lion.

abstract Cat
type Panther <: Cat 
  eye_color
  Panther() = new("green")
end
type Lion <: Cat
  mane_color
  roar::AbstractString
end
type Tiger
  taillength::Float64
  coatcolor
end
tigger = Tiger(3.5,"orange")

# For a non-constructor example, let's make a function meow for Lion, Panther 
# and Tiger:

function meow(animal::Lion)
    animal.roar # access type properties using dot notation
end

function meow(animal::Panther)
  "grrr"
end

function meow(animal::Tiger)
  "rawwwr"
end

# Testing the meow function
meow(tigger) # => "rawwr"
meow(Lion("brown","ROAAR")) # => "ROAAR"
meow(Panther()) # => "grrr"

# Defining a function that take type Cat
function pet_cat(cat::Cat)
  println("The cat says $(meow(cat))")
end

pet_cat(Lion("orange","1"))

# Now we define function with more arguments:
function fight(t::Tiger,c::Cat)
  println("The $(t.coatcolor) tiger wins!")
end

fight(tigger,Panther())

# We don't need a Tiger in order to fight
fight(l::Lion,c::Cat) = println("The victorious cat says $(meow(c))")

fight(Lion("brown","Let's fight"),Panther())

















