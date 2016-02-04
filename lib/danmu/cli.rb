require 'thor'
require_relative './douyu_client'

module Danmu
  class DanmuShow < Thor

    desc "douyu [url/id/shortname]", "DouyuDanmuClient For Ruby"
    long_desc <<-DANMU
    输入url/主播id或者短名就可以对弹幕进行抓取
    DANMU
    option :statistic
    def douyu( url )
      client = DouyuClient.new( url )
      client.start
    end

  end
end
