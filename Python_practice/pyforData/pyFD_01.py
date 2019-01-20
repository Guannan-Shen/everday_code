#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jan 18 22:58:33 2019

@author: guanshim
"""
#%%
%pwd

#%%
import os
os.getcwd()
## can not use ~ 
os.chdir("/home/guanshim/Documents/everyday_code/everday_code/Python_practice/pyforData/")

#%%
import numpy as np
data = {i : np.random.randn() for i in range(10)}
data

## introspection
print?
data?
np.*load*?
np.load?
np.load??
# the docstring is between """ """


#%%
## test of python script
%run ~/Documents/everyday_code/everday_code/Python_practice/pyforData/ipython_script_test.py
result
## Should you wish to give a script access to variables already defined
# in the interactive IPython namespace, use
## %run -i instead of plain %run

# ## In the IPython shell, running %matplotlib sets up the integration so you can create
## multiple plot windows without interfering with the console session:
%matplotlib