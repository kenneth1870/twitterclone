# spec/helpers/application_helper_spec.rb
require 'rails_helper'

describe ApplicationHelper, type: :helper do
  describe '#parse' do
    it 'should parse hashtags and mentions' do
      content = 'This is a #hashtag and a @mention'
      parsed_content = helper.parse(content)
    end
  end

  describe '#fetch_bg_img' do
    it 'should return the background image URL for signed-in users' do
      allow(helper).to receive(:user_signed_in?).and_return(true)
      expect(helper.fetch_bg_img).to eq('/assets/background_home.jpg')
    end

    it 'should return the background image URL for non-signed-in users' do
      allow(helper).to receive(:user_signed_in?).and_return(false)
      expect(helper.fetch_bg_img).to eq('/assets/img-1.jpg')
    end
  end
end
