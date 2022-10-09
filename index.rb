require 'sinatra'
require 'socket'
require 'stringio'

get '/' do
  StringIO.new.tap do |str|
    str << "<h2>Host IP Addresses</h2>"
    str << "<ol>"
    Socket.ip_address_list.each do |intf|
      if intf.ipv4? && !intf.ipv4_loopback? && !intf.ipv4_multicast?
        str << "<li>"
        str << intf.ip_address
        str << "</li>"
      end
    end
    str << "</ol>"

    str << "<h2>Client IP Address</h2>"
    str << "<ol><li>#{request.ip}</li></ol>"
  end.string
end
