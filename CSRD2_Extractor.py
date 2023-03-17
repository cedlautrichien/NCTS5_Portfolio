import xml.etree.ElementTree as ET

f = open("C:/Users/Dagmar/Documents/NCTS_Data/output.txt", "w")
fichier = "C:/Users/Dagmar/Documents/NCTS_Data/XML/simple.xml"

tree = ET.parse(fichier)

a = tree.findall("./RDEntityList/")
for i in a:

    j = len(i)
    k = 0
    while k < j:
        ch1 = i.attrib["name"]
        ch2 = i[k][1].attrib["name"]
        ch3 = i[k][1].text
        f.write(ch1)
        f.write(",")
        f.write(ch2)
        f.write(",")
        f.write(ch3)
        f.write("\n")
        k = k + 1
f.close()
