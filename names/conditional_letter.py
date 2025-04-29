import numpy as np
import matplotlib.pyplot as plt
import letter_to_pixel as ltp
import solid
import viewscad
from euclid3 import Point3

#|%%--%%| <WXj8UyVFXG|6bIykLUAam>

def get_conditional_letter(l1,l2):
    a = np.array(ltp.get_letter_pattern(l1))
    b = np.array(ltp.get_letter_pattern(l2))
    return a[:,:,np.newaxis] @ b[:,np.newaxis,:]

#|%%--%%| <6bIykLUAam|L9ZQ1xJ5DO>

def plot_cond_letter(c):
    fig = plt.figure(figsize=(10,8))
    ax = fig.add_subplot(111, projection='3d')
    ax.voxels(c)
    plt.show()
#|%%--%%| <L9ZQ1xJ5DO|1JB5Kp5fka>

s1 = 'ROBERT'
s2 = 'NANCEY'

# TODO use Bezier curves to interpolate between the letters' 3d points


""" TODO then loop through letters and plot them
for i in range(len(s1)):
    c = get_conditional_letter(s1[i],s2[i])
    c = spline_interp(c)
    solid.right(?) c
"""
