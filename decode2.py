from lxml import etree
import base64

root = etree.parse("Testfall.xml")
node_path = "/AML/Group[1]/ObjDef[1]/AttrDef[4]/AttrValue"
node = root.xpath(node_path)

element = node[0]
element_string = etree.tostring(element, encoding="unicode", method="text")

if element_string is not None:
    try:
        decoded_content = base64.b64decode(element_string)
    except base64.binascii.Error as e:
        print(f"Error decoding base64 content: {e}")
        exit()

    with open("result.zip", "wb") as file:
        file.write(decoded_content)

    print(f"Content of node '{node_path}' extracted and decoded successfully.")
else:
    print(f"Node '{node_path}' not found in the XML document.")
