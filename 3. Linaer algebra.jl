# It should be short chapter to show some linear algebra operations.
# Full list of these operations you can find on:
# http://docs.julialang.org/en/release-0.5/stdlib/linalg/

# Example matrix. If you want to test below operations you should remember
# about linear algebra laws.
A = ones(3,4)
B = [2 4 6;1 3 5;3 6 9; 7 8 8]
C = rand(5,5)

# Multicipation:
*(A,B)

# Division:
\(A,B)

# Dot product:
⋅(x, y)

# Cross product of two 3-vectors:
x(x,y)

# Transpose matrix:
transpose(A) # or:
A.'

# Sum:
+(A,B)

# Multicipation scalar and matrix
*(5,A)