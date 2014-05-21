class CreateTeacherComments < ActiveRecord::Migration
  def change
    create_table :teacher_comments do |t|
      t.string :teacherName
      t.text :description
      t.boolean :active
      t.string :language

      t.timestamps
    end
  end
end
