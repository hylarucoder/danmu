require 'spec_helper'
require '../../lib/danmu/clients/danmu_client'
describe Danmu do
  it 'pretty str' do
    expect(align_left_str("中国as",10,"|")).to be "中国as||||"
  end
end
