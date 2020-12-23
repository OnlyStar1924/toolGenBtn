import json

import random

with open("../input/levels_list.json") as f:
    data = json.load(f)

jsonlist = []
newlist = []

for line in data:
    for item in line: 
        jsonlist.append(line[item])



number = 1

while number < len(jsonlist): 
    newlist.append(jsonlist[number])
    number = number + 5


fo = open("../temp/inputText.csv","w")
fo.writelines("pack,level,name,color\n")


#sort item
for i in range(len(newlist)-1):
    for j in range(0, len(newlist)-i-1):
        if float(newlist[j].split(":")[0]) > float(newlist[j+1].split(":")[0]):
            newlist[j], newlist[j+1] = newlist[j+1], newlist[j]

colorIMG = ["Ellipse_yellow.png","Ellipse_red.png","Ellipse_tim.png","Ellipse_green.png","Ellipse_cyan.png","Ellipse_blue.png"]
dem =0


for item in newlist:
    a = item.split(":")
    b=a[0].split(".")

    if dem % 5 ==0:
        colorTemp = random.choice(colorIMG)
    fo.writelines(b[0]+","+b[1]+","+a[1][1:]+","+"/Users/defold/Projects/ToolGenBtn/input/image_btn/" +colorTemp+"\n")
    
    dem +=1

fo.close()