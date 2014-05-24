class CreateQuizzs < ActiveRecord::Migration
  def change
    create_table :quizzs do |t|
      t.text :description
      t.text :trueAnswer
      t.text :falseAnswer1
      t.text :falseAnswer2
      t.text :falseAnswer3
      t.string :language
      t.boolean :active
      t.references :card, index: true

      t.timestamps
    end
  end
end
