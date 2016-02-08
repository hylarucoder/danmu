# -*- encoding : utf-8 -*-
require 'open-uri'
require 'awesome_print'
require_relative './models/room_info'
require_relative './clients/danmu_client'
require 'json'
require 'nokogiri'

class DouyuClient
  DOUYU_PREFIX = "http://www.douyutv.com/"

  def initialize(url)
      init_config
      if url.include? DOUYU_PREFIX
      else
        url = DOUYU_PREFIX + url
      end
      room_html = open(url).read
      json1 = room_html[/var\s\$ROOM\s=\s({.*})/,1]
      json2 = room_html[/var\sroom_args\s=\s({.*})/,1]
      json1_format = valid_json?(json1)
      json2_format = valid_json?(json2)
      if json1_format && json2_format 
        room = RoomInfo.new(json1_format) 
        ap room
        auth_servers = valid_json?(URI::decode(json2_format['server_config']))
        auth_server_ip = auth_servers[0]["ip"]
        auth_server_port = auth_servers[0]["port"]
        client = DanmuClient.new(room.room_id,auth_server_ip,auth_server_port)
        client.start
      end
  end

  def filter_for_wireshark json_array
    ap json_array 
    str = ""
    for i in 0...json_array.length
      str += 'tcp.port==' + json_array[i]["port"] + '||'
    end
    puts str[0..-3]
  end


  def valid_json?(json)
    JSON.parse(json)
  rescue
    false
  end

  def init_config()
    # 初始化Log
  end
end
