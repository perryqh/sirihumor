require 'spec_helper'

describe "Posts" do

  describe "GET /posts" do
    before(:each) do
      @post   = Factory.create(:post)
      @post_2 = Factory.create(:post)

      visit '/'
    end

    it "displays posts" do
      within(:css, '#content') {
        page.should have_css('img.screenshot')
      }
    end
  end
end
