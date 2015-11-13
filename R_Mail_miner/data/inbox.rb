require 'win32ole'
require 'csv'

CSV.open("inbox_ol.csv", "w") do |csv|
  csv << ["from", "to", "date"]


  i = 0
  # @j = 0
  class OC; end

  def each_mail
    ol = WIN32OLE::connect("Outlook.Application")
    # WIN32OLE.const_load(ol, OC) if @j == 0
    myNameSpace = ol.getNameSpace("MAPI")
    folders = myNameSpace.GetDefaultFolder(6)
    items = folders.items
    # items.sort('ReceivedTime', OC::OlAscending)
    items.each do |mail|
    	GC.start
    	if (mail.ole_respond_to?('To') && mail.ole_respond_to?('SenderName') && mail.ole_respond_to?('ReceivedTime'))
        yield mail  
      end
    end

    
    folders.Folders.each do |folder|
    items = folder.items
    # items.sort('ReceivedTime', OC::OlAscending)
    items.each do |mail|
      GC.start
      if (mail.ole_respond_to?('To') && mail.ole_respond_to?('SenderName') && mail.ole_respond_to?('ReceivedTime'))
        yield mail  
      end
    end

  end	
end
    


  each_mail do |mail|
    # puts mail.Subject
    # puts "#{mail.SenderName} #{mail.To} #{mail.ReceivedTime}"
    csv << ["#{mail.SenderName}", "#{mail.To}", "#{mail.ReceivedTime.strftime("%Y-%m-%dT%H:%M:%S%:z")}"]

    i = i+1
    print "Process Inbox: # #{i}\r"
  end

end

    # @j = 1

# require 'win32ole'

# ol = WIN32OLE.new('Outlook.Application')
# class OC; end
# WIN32OLE.const_load(ol, OC)

# mapi = ol.GetNameSpace("MAPI")
# inbox = mapi.GetDefaultFolder(OC::OlFolderInbox)
# items = inbox.items
# items.sort('ReceivedTime', OC::OlAscending)

# items.getfirst
# items.getnext

# items.getlast
# items.getprevious