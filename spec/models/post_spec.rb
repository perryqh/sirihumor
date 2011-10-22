require 'spec_helper'

describe Post do
  describe 'validations' do
    should_validate_presence_of :screenshot
  end
end
