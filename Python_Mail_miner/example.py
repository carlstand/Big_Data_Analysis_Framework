import win32com.client as win32
# RANGE = xrange(3,8)

# def outlook():
app= 'Outlook'
outlook = win32.gencache.EnsureDispatch("%s.Application" % app) 
# mail=olook.CreateItem(win32.constants.olMailItem)
# mail.Recipients.Add('jianl@163.com')
# mail.Recipients.Add('jianliy@sina.com') 
# subj = mail.Subject = '21112Python -to - %s ' %app
# body = ["line %d" % i for i in RANGE]
# # body.insert(0,"%s\r\n" %subj)
# body.append("\r\nThat's all folks!")
# mail.Body = '\r\n'.join(body)
# mail.Send()
# print "send ok"

ns = outlook.GetNamespace("MAPI")
inbox = ns.GetDefaultFolder(win32.constants.olFolderInbox)
maillist = inbox.Items
print "total mails: {0}".format(maillist.Count)


with open("TAD.txt",'w') as fout:
	for item in maillist:	
		fout.write("{}\n".format(item.SentOn))
		try:
			fout.write("{}\n".format(item.Subject))
		except Exception as err:
			fout.write(str(err)+"\n")