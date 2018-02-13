#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Feb 12 20:00:00 2018

@author: Guannan Shen
"""
## list is a data type, considered as str() dbl in R
## list and dictionary object types
## the index from 0
# To create code cell with #%% in spyder
#%%
a_l = [1,2,3,"OK","Due",[2,"fine",5.45,3,66]]   ## nested sublist
b_l = []                                        ## empty list
print(a_l)
print(a_l[0])                                   ## index
print(a_l[5][1])                                ## index of index
print(len(a_l))                                      ## length
print(a_l[2:4])                                        ## slice 
c_l = list("spam")
d_l = list(range(4))                            ## list as an iterable
                                                ## range from 0 or range(6,9)
                          
## an iterable is object type in right of for loop, for i in iterable:
## iterable has a __getitem__  method
## "OK" is an iterator in a_l has a __next__ method
all_l = a_l + b_l + c_l + d_l                   ## concatenate
print(all_l)
print(c_l)
print(d_l)
