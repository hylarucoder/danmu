# -*- encoding : utf-8 -*-
class Message
  # 向斗鱼发送的消息
  # 1.通信协议长度,后四个部分的长度,四个字节
  # 2.第二部分与第一部分一样
  # 3.请求代码,发送给斗鱼的话,内容为0xb1,0x02, 斗鱼返回的代码为0xb2,0x02
  # 4.发送内容
  # 5.末尾字节
  def initialize(content)
    @length = [content.size + 9, 0x00, 0x00, 0x00].pack('c*')
    @code = @length.dup
    @magic = [0xb1, 0x02, 0x00, 0x00].pack('c*')
    @content = content
    @end = [0x00].pack('c*')
  end

  def to_s
    @length + @code + @magic + @content + @end
  end


  def self.parse_content(message_all)
    message_all[10, -2].unpack('c*')
  end

end

#m = Message.new("type@=chatmessage/rescode@=0/sender@=33528585/content@=......6666/snick@=CindyB/cd@=5/maxl@=20/chatmsgid@=9543d4703ae0432d65e9060000000000/col@=0/ct@=2/gid@=7/rid@=15780/sui@=id@A=33528585@Snick@A=CindyB@Srg@A=1@Spg@A=1@Sstrength@A=0@Sver@A=20150331@Sm_deserve_lev@A=0@Scq_cnt@A=0@Sbest_dlev@A=0@Slevel@A=1@Sgt@A=0@S/")
#p m.to_s 
