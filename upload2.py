!/usr/bin/python                                                                                                                                                    
import sys
import xmlrpclib
import pickle
import string
import re
import os

spacekey = sys.argv[1];
pagetitle = sys.argv[2];
contentType = sys.argv[3];
filename = sys.argv[4];



f=open(filename, 'rb');
data = f.read(); # slurp all the data                                                                                                                                
server = xmlrpclib.ServerProxy("https://wiki.pasadena.openx.org/rpc/xmlrpc");
token = server.confluence2.login("tq.wiki", "XXXX");

page = server.confluence2.getPage(token, "TECH", "Browsers");
#print "page is " + page;                                                                                                                                            
if page is None:
    exit("Could not find page " + spacekey + ":" + pagetitle);
    #print "don't exit here";                                                                                                                                        
else:

    attachment = {};
    attachment['fileName'] = os.path.basename(filename);
    attachment['contentType'] = contentType;
    server.confluence2.addAttachment(token, page['id'], attachment, xmlrpclib.Binary(data));
f.close();



#put the link into the current html file                                                                                                                             
sb=[]
sb.append("<a href=\"/download/attachments/");
sb.append(page['id']);
sb.append('/');
sb.append(filename);
sb.append("\">");
sb.append(filename);
sb.append("</a>");

newlink="".join(sb);
print newlink;


searchStr='<h3>IE Browser Version Distribution for All Ad Requests Hourly</h3>'
li=page["content"].rsplit(searchStr,1)
newContent = (newlink+searchStr).join(li)
page["content"] = newContent

server.confluence2.storePage(token, page)

