class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question_text
      t.integer :subject_id
      t.integer :user_id
    end
  end
end
