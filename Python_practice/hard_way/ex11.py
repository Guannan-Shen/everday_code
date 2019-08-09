# take input
print("How old are you?", end = "\t")
age = input()
print("How tall are you?", end = " ")
height = input()
print("How much do you weight?", end = " ")
weight = input()

print(f"So, you are {age} years old, {height} tall and {weight}lbs heavy.")

# convert string to number
# using input alone
Age = int(input("How old are you?\t"))
Height = float(input("How tall are you (inches)?\t"))
Weight = float(input("How much do you weight (lbs)?\t"))

print("So, you're {} old, {} tall and {}lbs heavy.".format(Age, Height, Weight))

input("How old are you?\t")
