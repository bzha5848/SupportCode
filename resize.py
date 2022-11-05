#!/usr/bin/python
from PIL import Image
import os, sys

path = "./30shot"
dirs = os.listdir( path )

def resize():
    for item in dirs:
        print(item)
        # if os.path.isfile(path+item):
        im = Image.open(path+'/'+item)
        f, e = os.path.splitext(path+item)
        imResize = im.resize((416,416), Image.ANTIALIAS)
        imResize.save(item, 'JPEG', quality=90)

resize()