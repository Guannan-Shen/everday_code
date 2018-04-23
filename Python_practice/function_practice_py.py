#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb 15 12:18:21 2018

@author: hithrill
"""

#%%
def print_nums(x):
    for i in range(x):
        print(i)
        return                     ## a wrong return
print_nums(100)                    ## the output is always zero

a = 'cheese'
print(a + 'shop')                  ## still not fine with cancatenation


#%% 2 sum 




#%%
def main():
    print("This function is to illustrate a chaos")
    x = float(input("Enter a number between 0 and 1: "))
    if  (x <= 0 or x >= 1):
        print("Invalid Value, plz enter value between 0 and 1")
    else:
        for i in range(10) :
            x = 3.9 * x * (1 - x)
            print(x)
main()


#%%
import pip
installed_packages = pip.get_installed_distributions()
installed_packages_list = sorted(["%s==%s" % (i.key, i.version)
     for i in installed_packages])
print(installed_packages_list)


#%%
# chaoti function
def main2():
    print("This function is to illustrate a chaos")
    nloop = int(input("Enter a integer greater than 1: "))
    x = float(input("Enter a number between 0 and 1: "))
    if  (x <= 0 or x >= 1):
        print("Invalid Value, plz enter value between 0 and 1")
    else:
        for i in range(nloop) :
            x = 3.9 * x * (1 - x)
            print(x)
main2()




