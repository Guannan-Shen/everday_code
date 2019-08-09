# What we’ll do now is write a
# script that also accepts arguments.
from sys import argv
# read the WYSS section for how to run this
script, first, second, third = argv

print("The script is called:", script, sep = "--")
print("Your first variable is:", first, sep = "--")
print("Your second variable is:", second, sep = "--")
print("Your third variable is:", third, sep = "--")
