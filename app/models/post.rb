class Post < ActiveRecord::Base
  mount_uploader :screenshot, ScreenshotUploader
  validates :screenshot, :presence => true

  scope :active_posts, where(:active => true)
end