class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.text :title
      t.text :text
      t.integer :position, :default => 0
      t.references :chapter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
