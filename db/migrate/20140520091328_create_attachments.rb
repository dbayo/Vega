class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file_name
      t.string :url
      t.references :user, polymorphic: true, index: true

      t.timestamps
    end
  end
end
