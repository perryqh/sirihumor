FactoryGirl.define do

  factory :post do
    screenshot File.open('spec/testimage.gif')
  end
end
