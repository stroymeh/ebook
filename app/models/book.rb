class Book < ActiveRecord::Base
  belongs_to :user

  has_many :chapters, -> { order('position desc') }, :dependent => :destroy
end
