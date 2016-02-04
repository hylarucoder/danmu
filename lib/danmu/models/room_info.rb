# -*- encoding : utf-8 -*-
require 'nokogiri'
class RoomInfo
  attr_accessor :room_id, :room_name, :room_gg_show, :owner_name, :owner_uid, :room_tags

  def initialize(json)
    #@json = json
    @room_id = json["room_id"]
    @room_name = json["room_name"]
    @room_gg_show = Nokogiri::HTML(json["room_gg"]["show"]).text
    @room_gg_status = json["room_gg"]["status"]
    @room_gg_pass = json["room_gg"]["pass"]
    @room_pic = json["room_id"]
    @owner_uid = json["owner_uid"]
    @owner_name = json["owner_name"]
    @room_url = json["room_url"]
    @show_id = json["show_id"]
    @room_pwd = json["room_pwd"]
    @cate_id = json["cate_id"]
    @near_show_time = json["near_show_time"]
    @room_tags = []
    room_tags_json = json["all_tag_list"]
    room_tags_size = json["room_tag_list"].size
    for i in 0...(room_tags_size)
      @room_tags << room_tags_json[json["room_tag_list"][i]]["name"]
    end

  end
end
