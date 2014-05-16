class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :lastName, :string
    add_column :users, :mode, :string
  end
end
