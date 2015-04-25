class Section < ActiveRecord::Base
  belongs_to :chapter

  has_many :attachments, -> { order('position') }, :dependent => :destroy
end
