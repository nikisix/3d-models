import numpy as np
import matplotlib.pyplot as plt
import letter_to_pixel as ltp

import pythonopenscad as posc
# import solid

# import viewscad
from euclid3 import Point3
from pythonopenscad import base

# |%%--%%| <WXj8UyVFXG|6bIykLUAam>


def get_conditional_letter(l1, l2):
    a = np.array(ltp.get_letter_pattern(l1))
    b = np.array(ltp.get_letter_pattern(l2))
    return a[:, :, np.newaxis] @ b[:, np.newaxis, :]


# |%%--%%| <6bIykLUAam|L9ZQ1xJ5DO>


def plot_cond_letter(c):
    fig = plt.figure(figsize=(10, 8))
    ax = fig.add_subplot(111, projection="3d")
    ax.voxels(c)
    plt.show()


# |%%--%%| <L9ZQ1xJ5DO|1JB5Kp5fka>

s1 = "ROBERT"
s2 = "NANCEY"

# TODO use Bezier curves to interpolate between the letters' 3d points

for i in range(len(s1)):
    c = get_conditional_letter(s1[i], s2[i])
    print(c)
    # plot_cond_letter(c)

""" TODO then loop through letters and plot them
for i in range(len(s1)):
    c = get_conditional_letter(s1[i],s2[i])
    c = spline_interp(c)
    solid.right(?) c
"""


# instead of printing the 3d array, create verticies for it using the pythonopenscad library
# and then use viewscad to display it
# TODO create a function to convert the 3d array to verticies
def array_to_verticies(c):
    verts = []
    for i in range(c.shape[0]):
        for j in range(c.shape[1]):
            for k in range(c.shape[2]):
                if c[i, j, k] > 0:
                    verts.append(Point3(i, j, k))
    return posc.union(*[posc.cube(1).translate(v) for v in verts])
