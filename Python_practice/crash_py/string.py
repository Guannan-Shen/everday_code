# To ensure that no whitespace exists at the right end of a string, 
# use the rstrip() method.
space = "python  "
non_space = "python"
print(space == non_space)
# Don't forget the function ()
tab = "python	"
print(space.rstrip() == non_space)
escape = "python\t"
print(tab.rstrip() == non_space)
print(escape.rstrip() == non_space)
# lstrip and strip
print("Albert Einstein once said, \"A person who never made a mistake never tried anything new.\"")

print("A\n".rstrip())
print("B")

print(0.2 + 0.1)
