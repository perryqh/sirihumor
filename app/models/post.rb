class Post < ActiveRecord::Base
  before_validation :parse_message, :on => :create
  attr_accessor :message
  mount_uploader :screenshot, ScreenshotUploader
  validates :screenshot, :presence => true

  scope :active_posts, where(:active => true)

  private
  def parse_message
    if message
      self.screenshot = message_attachment_as_file unless message.attachments.empty?
      self.from_email = message.from
    end
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
