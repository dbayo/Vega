class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.boolean :active
      t.string :language

      t.timestamps
    end
  end
end
