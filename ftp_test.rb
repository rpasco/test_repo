require 'net/ftp'
require 'nokogiri'
require 'zlib'

ftp = Net::FTP.new
ftp.connect('on.tmstv.com')
ftp.login('oninpdev','432ny154')
ftp.chdir('/On2/anly')
ftp.getbinaryfile('on_anly_tv_sources_v22_20140707.xml.gz')
ftp.close

Zlib::GzipReader.open('on_anly_tv_sources_v22_20140707.xml.gz') do |gz|
	File.open("test.xml", "w") do |g|
		IO.copy_stream(gz, g)
	end
end


#doc.each do |node|
#	if node.name == 'prgSvc' && node.node_type == 1
#		puts node.attribute('prgSvcId')
#	end
#end