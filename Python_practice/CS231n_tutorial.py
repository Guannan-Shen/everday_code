# -*- coding: utf-8 -*-
"""
Created on Fri Jun 29 13:09:37 2018

@author: hithr
"""

#From CS231n stanford
#%%
# the quicksort algorithm
def quicksort(arr):
    if len(arr) < 1:
        return arr
    pivot = arr[len(arr)//2]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    return quicksort(left) + middle + quicksort(right)
str_te = [5,1,32,5,65,6,34,4,63,46435,7634,6425,523523,]
print(quicksort(str_te))

#%%
#numbers
x = 3
x += 1
print(x)
x *= 2
print(x)
print(x // 3)
print(x % 5)
print(x ** 3)
y = 2.5343
print(type(y))

# boolean type
t = True
f = False

print(t and f)
print(t or f)
print(not f)
print(t != t)

# strings
# python has methods for strings
h = 'hello'
w = 'world'
print(h + " " + w)
print(len(h))
l = "love"
n = "qiwen yu"
ln = "guannan shen %s %s for %d days" % (l, n, 365*10000)
print(ln)
print(ln.title())
print(ln.capitalize())
print(ln.casefold())
print(ln.center(50))
print(ln.upper())
print(ln.replace('love', 'fuck'))

#%%
## the Containers
## list is the python equivalent of array
print("list can contain elements of different types")
