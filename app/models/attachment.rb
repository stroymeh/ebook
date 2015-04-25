class Attachment < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader

  belongs_to :page

  validates_presence_of :file

  def content_type
    file.file.extension
  end

  def human_filename
    file.path.split("/").last
  end

  def is_image?
    %w(jpg jpeg png).include?(content_type)
  end

  def is_pdf?
    'pdf'.include?(content_type)
  end
end
