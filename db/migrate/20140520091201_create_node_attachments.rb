class CreateNodeAttachments < ActiveRecord::Migration
  def change
    create_table :node_attachments do |t|
    	t.integer :attachment_id
		t.integer :nodeable_id
		t.string :nodeable_type
		t.timestamps
    end
  end
end
