class AttachmentUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  include CarrierWave::MimeTypes

  process :set_content_type

  version :main, :if => :image? do
    process :resize_to_fit => [870,580]
  end

  version :large, :if => :image? do
    process :resize_to_fit => [1140, 760]
  end

  version :medium, :if => :image? do
    process :resize_to_fit => [570, 380]
  end

  version :thumb, :if => :image? do
    process :resize_to_fit => [270, 180]
  end

  def extension_white_list
    %w(jpg jpeg gif png pdf exe zip rar)
  end

  protected

  def image?(new_file)
    new_file.content_type.start_with? 'image'
  end
end
