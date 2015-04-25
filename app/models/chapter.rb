class Chapter < ActiveRecord::Base
  belongs_to :book

  has_many :sections, -> { order('position desc') }, :dependent => :destroy
end
