class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file
      t.integer :position, :default => 0
      t.references :section, :index => true

      t.timestamps :null => false
    end

    add_foreign_key :attachments, :sections
  end
end
