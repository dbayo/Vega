class CreateSystemVars < ActiveRecord::Migration
  def change
    create_table :system_vars do |t|
      t.string :code
      t.text :description

      t.timestamps
    end
  end
end
