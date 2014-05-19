class AddFieldsToCards < ActiveRecord::Migration
  def change
    add_column :cards, :language, :string
    add_column :cards, :bookOfKnowledge, :boolean
    add_column :cards, :educators, :boolean
  end
end
