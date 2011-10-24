class Post < ActiveRecord::Base
  before_validation :set_attachment
  attr_accessor :message
  mount_uploader :screenshot, ScreenshotUploader
  validates :screenshot, :presence => true

  scope :active_posts, where(:active => true)

  private
  def set_attachment
    self.screenshot = message_attachment_as_file unless message.nil? || message.attachments.empty?
  end

  def message_attachment_as_file
    attachment = message.attachments.first
    file = StringIO.new(attachment.decoded)
    file.class.class_eval { attr_accessor :original_filename, :content_type }
    file.original_filename = attachment.filename
    file.content_type = attachment.mime_type

    file
  end
end
