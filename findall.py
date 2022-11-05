import os
import csv
def fileFind(number, file):
    files = []
    count = 0
    for i in os.listdir("./alltrain"):
        if i.endswith('.txt'):
            files.append(i)
    for item in files:

        file_data = []
        temp = []


        with open("./alltrain"+'/'+item, 'r') as myFile:
            is_here = False
            for line in myFile:
                currentLine = line[:-1]
                data = currentLine.split(" ")
              
                for i in data:
                    if i.isdigit():
                        temp = float(i)
                        i = str(int(temp))
                        num: int = int(i)
                        if (num == number):
                            # print(item)
                            # file.write(item+'\n')
                            is_here = True
                            # count = 0
            if is_here:
                count = count+1
                # if count >= 7:
                file.write(item+'\n')
                count = 0

f = open("allfrog.txt", "w")
# for n in range(0, 80):
fileFind(80, f)
# fileFind(83, f)

f.close()
shopping = open("allfrog.txt")
lines = shopping.readlines()
lines.sort()
sorted_lines = sorted(set(lines))
file = open("allfrogSORT.txt", "w")
file.writelines(sorted_lines)
file.close()
shopping.close()