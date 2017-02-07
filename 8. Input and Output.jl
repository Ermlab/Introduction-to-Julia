# In Julia you can work with files.

#******************************************************************************#
#                               8.1 Opening files                              #
#******************************************************************************#

# To open file use open() function:

stream = open("Files/file.txt", "r")
# or you can do it like this
# open("Files/file.txt", "r")
#   Do some stuff
# end

# As second parametr you must give mode. To see available modes check this:
# http://docs.julialang.org/en/release-0.5/stdlib/io-network/

# To read from file use readlines() function:
lines = readlines(stream)

# You can step line by line:
counter = 1
for l in lines 
    println("$counter | $l")
    counter += 1
end

# Don't forget about close the file:
close(stream)

# You can read file until you reach end of file:
open("Files/file.txt") do f
    line = 1
    while !eof(f)
        x = readline(f)
        println("$line $x")
        line += 1
    end
end

# An easier approach is to use enumerate() on an iterable object — 
# you'll get the line numbering for free:

open("Files/file.txt") do f
    for i in enumerate(eachline(f))
      println(i)
    end
end

# If you have a specific function that you want to call on a file, you can use
# this alternative syntax:

function bigUp(stream::IOStream)
    line = 1
    for ln in eachline(stream)
      print("$line line length: $(length(ln))\n")
      line += 1
    end
    close(stream)
end

bigUp(open("Files/file.txt"))


# You can check file stats:
stats = stat("Files/file.txt")
stats.ctime
stats.size

#******************************************************************************#
#                               8.1 Writing to files                           #
#******************************************************************************#

# This action overwrite your file.
# If file doesn't exists write() create it.
stream = open("Files/file_save.txt", "w")
write(stream, "New part of text\n")
close(stream)

# To write at the end of file without overwriting it, 
# open the file in append mode
stream = open("Files/file_save.txt", "a")
write(stream, "Added part of text\n")
close(stream)

#******************************************************************************#
#                                  Conclusion                                  #
#******************************************************************************#

# In writing strigs we used "\n". This symbol means end of line.
# In this chapter you see only basic functions to handle input and output
# in Julia. You can read more about it on this websites:
# http://docs.julialang.org/en/release-0.4/stdlib/io-network/
# https://en.wikibooks.org/wiki/Introducing_Julia/Working_with_text_files

# In Julia you can working with network too. For informations how to do this you
# should visit Julia manual page (the first link)


















