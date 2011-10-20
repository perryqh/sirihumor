require 'spec_helper'

describe "Posts" do

  describe "GET /posts" do
    before(:each) do
      @post   = Factory.create(:post)
      @post_2 = Factory.create(:post)

      visit '/'
    end

    it "displays posts" do
      within(:css, 'tbody') {
        page.should have_content(@post.name)
        page.should have_content(@post_2.name)
      }
    end
  end
end
