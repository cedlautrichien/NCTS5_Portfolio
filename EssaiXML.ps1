# create the root element
$root = New-Object System.Xml.XmlElement("root")

# create a child element with an attribute
$child = $root.OwnerDocument.CreateElement("child")
$child.SetAttribute("attribute_name", "attribute_value")

# add the child element to the root element
$root.AppendChild($child)

# create an XML document object with the root element
$xml = New-Object System.Xml.XmlDocument
$xml.AppendChild($xml.ImportNode($root, $true))

# save the XML document to a file
$xml.Save("output.xml")
