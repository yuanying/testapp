require 'sinatra'
require 'socket'
require 'stringio'

get '/' do
  StringIO.new.tap do |str|
    content_type :text
    str << "## Requested Host\n"
    str << "- #{request.host}\n\n"
    str << "## Host IP Addresses\n"
    Socket.ip_address_list.each do |intf|
      if intf.ipv4? && !intf.ipv4_loopback? && !intf.ipv4_multicast?
        str << "- "
        str << intf.ip_address
        str << "\n"
      end
      # if intf.ipv6? && !intf.ipv6_loopback? && !intf.ipv6_multicast?
      #   str << "- "
      #   str << intf.ip_address
      #   str << "\n"
      end
    end

    str << "\n"
    str << "## Client IP Address\n"
    str << "- #{request.ip}\n"
  end.string
end
