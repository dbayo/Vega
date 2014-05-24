class CreateFunFacts < ActiveRecord::Migration
  def change
    create_table :fun_facts do |t|
      t.text :description
      t.string :language
      t.boolean :active
      t.references :card, index: true

      t.timestamps
    end
  end
end
