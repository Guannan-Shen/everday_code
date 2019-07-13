book_titile = 'Gone with the wind'
# the brace after the .title
# .title is a method of string
# Every method is followed by a set of parentheses, because
# methods often need additional information to do their work.
print(book_titile.title())
print(book_titile.upper())
print(book_titile.lower())
# check is lower of is upper or not
# the function method of class title(self)
# istitle(self)
print(book_titile.islower())
print(book_titile.istitle())

# Using Variables in Strings
first_name = "qiwen"
last_name = "yu"
# the space between the first and last name
# These strings are called f-strings. The f is for format, because Python
# formats the string by replacing the name of any variable in braces with its
# value.
name = f'{first_name} {last_name}'
print(name.title())
# If you’re using Python 3.5 or earlier,
# you’ll need to use the format() method rather than this f syntax.
print(f'Hello, {name.title()}!')
# the version before Python 3.5
print('{} cutie {}'.format(first_name, last_name).title())

# add a tab
print('\tPython')
