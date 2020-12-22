import sys
import os
from PIL import Image

distance = 20
levelPerpack =5

#add list
listIMG = []
table = os.listdir("../temp/png")

for item in table:
    if item[-3:] == "png":
        listIMG.append(item)
listIMG.sort()

index =0


while index < len(listIMG):
    # #combine
    images = [Image.open("../temp/png/"+x) for x in listIMG[index:index+levelPerpack]]
    widths, heights = zip(*(i.size for i in images))

    total_width = max(widths)
    max_height = sum(heights) + distance*levelPerpack

    new_im = Image.new('RGBA', (total_width, max_height))

    y_offset = 0
    for im in images:
        new_im.paste(im, (0,y_offset))
        y_offset += im.size[1] + distance

    strName = int(index/levelPerpack+1)
    
    file_path = "../output/pack_{name:02d}.png"
    file_path = file_path.format(name = strName)
    new_im.save(file_path)

    index += levelPerpack


