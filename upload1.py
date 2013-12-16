!/usr/bin/python                                                                                                                                                    
#                                                                                                                                                                    
# Reads from standard input, dumps it onto a Confluence page                                                                                                         
# You'll need to modify the URL/username/password/spacekey/page title                                                                                                
# below, because I'm too lazy to bother with argv.                                                                                                                   
import sys
from xmlrpclib import Server
import pickle


# Read the text of the page from standard input                                                                                                                      
#content = sys.stdin.read()                                                                                                                                          


print sys.argv[1]

print sys.argv[2]


sb=[]
sb.append('<table><tbody>')

f=open(sys.argv[1],'r');
while f:
    line = f.readline()
    if(len(line) == 0): break
    as1 = line.split('\t')
    sb.append('<tr>')
    for item in as1:
        sb.append('<td>')
        sb.append(item)
        sb.append('</td>')
    sb.append('</tr>')
sb.append('</tbody></table>')
f.close()


table="".join(sb)
print sb
#s = Server("http://10.0.13.127:8090/rpc/xmlrpc")                                                                                                                    
s = Server("https://wiki.pasadena.openx.org/rpc/xmlrpc")

token = s.confluence2.login("tq.wiki", "RUvDHPrn")
page = s.confluence2.getPage(token, "TECH", "Browsers")
#no use                                                                                                                                                              
#new = "<ac:macro ac:name=\"chart\"><ac:parameter ac:name=\"title\">Cars Sold</ac:parameter><ac:parameter ac:name=\"type\">bar</ac:parameter><ac:rich-text-body><tab\
le><tbody><tr><th><p>Cars Type</p></th><th><p>2004</p></th><th><p>2005</p></th></tr><tr><th><p>Sedan</p></th><td><p>9,800</p></td><td><p>5,300</p></td></tr><tr><th>\
<p>SUV</p></th><td><p>2,900</p></td><td><p>4,200</p></td></tr><tr><th><p>PickUp</p></th><td><p>3,500</p></td><td><p>1,500</p></td></tr></tbody></table></ac:rich-tex\
t-body></ac:macro>"                                                                                                                                                  

#old=page["content"]                                                                                                                                                 
#print old                                                                                                                                                           

searchStr='<h3>IE Browser Version Distribution for All Ad Requests Hourly</h3>'
li=page["content"].rsplit(searchStr,1)
newContent = (table+searchStr).join(li)
page["content"] = newContent
s.confluence2.storePage(token, page)

#f= open('output','w')                                                                                                                                               
#print >>f,newContent                                                                                                                                                
#page['content'] = "".join(sb)                                                                                                                                       




st=[]
st.append('<table><tbody>')

f=open(sys.argv[2],'r');
while f:
    line = f.readline()
    if(len(line) == 0): break
    as1 = line.split('\t')
    st.append('<tr>')
    for item in as1:
    st.append('<td>')
        st.append(item)
        st.append('</td>')
    st.append('</tr>')
st.append('</tbody></table>')
f.close()


table1="".join(st)
print st
#s = Server("http://10.0.13.127:8090/rpc/xmlrpc")                                                                                                                    
s = Server("https://wiki.pasadena.openx.org/rpc/xmlrpc")

token = s.confluence2.login("tq.wiki", "RUvDHPrn")
page = s.confluence2.getPage(token, "TECH", "General Statistics for Various Aspects of the Traffic")
#no use                                                                                                                                                              
#new = "<ac:macro ac:name=\"chart\"><ac:parameter ac:name=\"title\">Cars Sold</ac:parameter><ac:parameter ac:name=\"type\">bar</ac:parameter><ac:rich-text-body><tab\
le><tbody><tr><th><p>Cars Type</p></th><th><p>2004</p></th><th><p>2005</p></th></tr><tr><th><p>Sedan</p></th><td><p>9,800</p></td><td><p>5,300</p></td></tr><tr><th>\
<p>SUV</p></th><td><p>2,900</p></td><td><p>4,200</p></td></tr><tr><th><p>PickUp</p></th><td><p>3,500</p></td><td><p>1,500</p></td></tr></tbody></table></ac:rich-tex\
t-body></ac:macro>"                                                                                                                                                  

#old=page["content"]                     
#print old                                                                                                                                                           

searchStr1='<h3>IE Browser Version Distribution for All Ad Requests Hourly</h3>'
li1=page["content"].rsplit(searchStr1,1)
newContent1 = (table1+searchStr1).join(li1)
page["content"] = newContent1



#f= open('output','w')                                                                                                                                               
#print >>f,newContent                                                                                                                                                
#page['content'] = "".join(sb)                                                                                                                                       



#f= open('output','w')                                                                                                                                               
#print >>f,newContent                                                                                                                                                
#page['content'] = "".join(sb)                                                                                                                                       

s.confluence2.storePage(token, page)


