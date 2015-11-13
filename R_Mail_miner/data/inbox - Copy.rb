require 'win32ole'
require 'csv'

CSV.open("C:/xiwen/inbox_ol.csv", "w") do |csv|
  csv << ["from", "to", "date"]


  i = 0

  def each_mail
    ol = WIN32OLE::connect("Outlook.Application")
    myNameSpace = ol.getNameSpace("MAPI")
    folders = myNameSpace.GetDefaultFolder(6)
    
    folders.Items.each do |mail|
    	GC.start
    	if (mail.ole_respond_to?('To') && mail.ole_respond_to?('SenderName') && mail.ole_respond_to?('ReceivedTime'))
        yield mail  
      end
    end

    
    folders.Folders.each do |folder|
    folder.Items.each do |mail|
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
  end

  puts i


end