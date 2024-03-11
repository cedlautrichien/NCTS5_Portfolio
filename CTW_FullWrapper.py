import os, re, random, datetime
# change folder name here
my_dir='C:\\git\\wbtests\\Testnachrichten\\WorkingCopy2\\'
# message types for external domain
list=['CC015C','CC013C','CC170C','CC014C','CC141C','CC007C','CC044C']

def replaceXML(replace_what,replace_with):
    # loop through all files in directory
    for fn in os.listdir(my_dir):
        #print(fn)
        pathfn = os.path.join(my_dir,fn)
        if os.path.isfile(pathfn):
            file = open(pathfn, 'r+')
            new_file_content=''
            for line in file:
                p = re.compile(replace_what)
                new_file_content += p.sub(replace_with, line)
            file.seek(0)
            file.truncate()
            file.write(new_file_content)
            file.close()

a1=' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"'
a2=''
d1=' <?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
d2=''
replaceXML(a1,a2)
replaceXML(d1,d2)

for msg in list:
    icref=str(random.randrange(100000000000,999999999999))
    now=datetime.datetime.now()
    date_string=now.strftime("%Y%m%d%H%M%S")
    prepdt=str(int(date_string))
    b1='<ns2:'+msg+' xmlns:ns2="http://ncts.dgtaxud.ec" xmlns:ns3="urn:eds:datamodel:EDS:EDS_EXTENSIONS:1">'
    b2='<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:v01="urn:http://brz.gv.at/ezoll/V01">\n<soapenv:Header/>\n<soapenv:Body>\n<v01:sendMessages>\n<arrayOfTransitRequestBean_1>\n<id>1</id>\n<message><![CDATA[<ns2:Msg xmlns:ns2="http://brz.gv.at/ezoll/V01" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n<ns2:MsgSdr>swp.transit.agent</ns2:MsgSdr>\n<ns2:MsgRcp>NTA.AT</ns2:MsgRcp>\n<ns2:PrepDT>'+prepdt+'</ns2:PrepDT>\n<ns2:ICRef>'+icref+'</ns2:ICRef>\n<ns2:Appl>acc</ns2:Appl>\n<ns2:Test>1</ns2:Test>\n<ns2:MsgTyp>'+msg+'</ns2:MsgTyp>\n<ns4:'+msg+' xmlns:ns4="http://ncts.dgtaxud.ec" xmlns:ns3="urn:eds:datamodel:EDS:EDS_EXTENSIONS:1">'
    c1='</ns2:'+msg+'>'
    c2='</ns4:'+msg+'>\n</ns2:Msg>]]>\n</message>\n<operatorId>ReleaseTest01</operatorId>\n</arrayOfTransitRequestBean_1>\n</v01:sendMessages>\n</soapenv:Body>\n</soapenv:Envelope>'

    replaceXML(b1,b2)
    replaceXML(c1,c2)

