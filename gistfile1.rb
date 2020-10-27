require 'net/http'
require 'digest'
require 'fileutils'
include FileUtils

tomcat_version = "7.0.52"
tomcat_tgz = "apache-tomcat-#{tomcat_version}.tar.gz"
tomcat_dl_url = URI("http://mirror.reverse.net/pub/apache/tomcat/tomcat-7/v7.0.52/bin/#{tomcat_tgz}")
tomcat_md5_url = URI("https://www.apache.org/dist/tomcat/tomcat-7/v7.0.52/bin/#{tomcat_tgz}.md5")

`wget #{tomcat_dl_url}`

md5 = Net::HTTP.get(tomcat_md5_url).split[0]

digest = Digest::MD5.new
digest.file "#{tomcat_tgz}"

puts "hexdigest: #{digest.hexdigest}"
puts "md5: #{md5}"

unless digest.hexdigest == md5
        throw Exception.new "invalid digest - redownload tomcat"
end

`tar xzvf #{tomcat_tgz}`

mv "apache-tomcat-#{tomcat_version}", "tomcat"

