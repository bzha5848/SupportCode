import os
import csv
import numpy as np

def Rand(start, end, num):
    res = []
    sampleSize = num
    answerSize = 0

    while answerSize < sampleSize:
        r = np.random.randint(start, end)
        if r not in res:
            answerSize += 1
            res.append(r)
 
 
    return res
 
 
# Driver Code
# num = 5
# start = 0
# end = 743
# result = Rand(start, end, num)
# result.sort()

group = 20

for x in range(group):
    num = 5
    start = 0
    end = 743
    result = Rand(start, end, num)
    result.sort()
    print(result)

    numfile = str(x+1)
    name = 'frog_' + numfile +'.txt'
    file = open(name, "w")

    count = 0
    rescount = 0

    with open("allfrog.txt") as search:
        for line in search:
            if rescount < num:
                
                if count == result[rescount]:
                    file.write(line)
                    rescount += 1

            count += 1
