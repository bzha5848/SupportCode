import os
import csv
def fileFind(number, file,group):
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
                if count >= 123+group:
                    file.write(item+'\n')
                    count = 0


group = 20

for x in range(group):

    f = open("available.txt", "w")
    # for n in range(0, 80):
    fileFind(80, f,group)

    f.close()

    numfile = str(x+1)
    name = 'Newfrog_' + numfile +'.txt'

    shopping = open("available.txt")
    lines = shopping.readlines()
    lines.sort()
    sorted_lines = sorted(set(lines))
    file = open(name, "w")
    file.writelines(sorted_lines)
    file.close()
    shopping.close()