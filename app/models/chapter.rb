class Chapter < ActiveRecord::Base
  belongs_to :book

  has_many :sections, -> { order('position') }, :dependent => :destroy
end
