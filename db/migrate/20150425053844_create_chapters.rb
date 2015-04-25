class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.text :title
      t.integer :position
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
