class Post < ActiveRecord::Base
  mount_uploader :screenshot, ScreenshotUploader
  validates :screenshot, :presence => true
end