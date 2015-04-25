class Book < ActiveRecord::Base
  belongs_to :user

  has_many :chapters, -> { order('position') }, :dependent => :destroy

  def sort_childrens(items)
    items.each_with_index do |id, index|
      Chapter.find(id).update_attributes(:position => index + 1)
    end
  end
end
