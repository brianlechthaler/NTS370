
# coding: utf-8

# # Project 3.2
# *Brian Lechthaler*
# 
# *4/9/2019*
# 
# *NTS370/G. Miles*

# In[1]:


#Import Dependencies
import numpy as np


# In[2]:


#Declare minimum and maximum values for range.
#By default, min=1 and max=100, so the result should be integers 1-100
rangeMin = 1
rangeMax = 100


# In[3]:


#Create array y as a range of integers
y = np.arange(100).reshape(rangeMin, rangeMax)
with np.nditer(y, op_flags=['readwrite']) as it:
        for x in it:
                x[...] = 1 + x

#Flip array y and output to array a
a = np.fliplr(y)


# In[4]:


#Print arrays
print(y)
print(a)


# In[5]:


#Print sums of array axis
print(y.sum())
print(a.sum())

