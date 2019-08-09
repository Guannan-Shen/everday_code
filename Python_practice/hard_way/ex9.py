# the print() function in python
# the end in print() not just start a newline
print("I have underestimated the print function...", end = "\n\n\n     ")
print(", as I always.")

# print string together with variables
days = "Mon Tue Wed Thu Fri Sat Sun"
months = "Jan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"

print("Here are the days: ", days)
print("Here are the months: ", months)

print("""
There's something going on here.
With the three double-quotes.
We'll be able to type as much as we like.
As many lines as we want.
These are not strings.
""")

# \* There are various “escape sequences” available
# for different characters you might want to use.
print("I am 6'2\" tall.") # escape double quotes
print('I am 6\'2 tall.')  # escape single quote

# \t tab
tabby_cat = "\tI'm tabbed in."
persian_cat = "I'm split \non a line."
backslash_cat = "I'm \\ a \\ cat."

fat_cat = """
I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
"""

print(tabby_cat)
print(persian_cat)
print(backslash_cat)
print(fat_cat)

# \n \\ \\ \t \t* \' \"
print("\a cat")
print("I'm \b the best")
print("\nI saw \n{}, \n\t{}, \n\t\t{}".format("Moon", "Sun", "Star!"))
single_cat = '''\n
I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass'''

print(single_cat)
