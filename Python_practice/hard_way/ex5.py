# make strings that have variables embedded in them
name = 'Zed A. Shaw'
age = 35 # not a lie
height = 74 # inches
weight = 180 # lbs
eyes = 'Blue'
teeth = 'White'
hair = 'Brown'
# f"" f must close to the ""
print(f"Let's talk about {name}.")
print(f"He's {height} inches tall.")
print(f"He's {weight} pounds heavy.")
print(f"Actually that's not too heavy.")
print(f"He's got {eyes} eyes and {hair} hair.")
print(f"He's teeth are usually {teeth} depending on the coffee.")

# this line is tricky, try to get it exactly right
total = age + height + weight
print(f"if I add {age}, {height}, and {weight} I get {total}.")

# more strings and " {}".format(var)
types_of_people = 10
x = f"There are {types_of_people} types of people."

binary = "binary"
do_not = "don't"
y = f"Those who know {binary} and those who {do_not}."
print(x)
print(y)

print(f"I said {x}")
print(f"I also said '{y}'")

hilarious = False
joke_evaluation = "Isn't that joke so funny?! {}"

print(joke_evaluation.format(hilarious))

w = "This is the left side of..."
e = "a string with a right side."

print(w + e)

# more practices
print("Mary had a little lamb.")
print("Its fleece was white as {}".format('snow.'))
print("And everywhere that Mary went.")
print('.' * 10)

end1 = 'C'
end2 = 'h'
end3 = 'e'
end4 = 'e'
end5 = 's'
end6 = 'e'
end7 = 'B'
end8 = 'u'
end9 = 'r'
end10 = 'g'
end11 = 'e'
end12 = 'r'

print(end1 + end2 + end3 + end4 + end5 + end6, end = " ")
print(end7 + end8 + end9 + end10 + end11 + end12)

# more practice
formatter = "{} {} {} {}"
# take the formatter string here and call its function .format()
print(formatter.format('1', '2', '3', '4'))
print(formatter.format(1, 2, 3, 4))
print(formatter.format('one', 'two', 'three', 'four'))
print(formatter.format(True, False, True, False))
print(formatter.format(formatter, formatter, formatter, formatter))
print(formatter.format(
      "Try your",
      "own text here",
      "Maybe a poem",
      "Or a song about fear."
))
