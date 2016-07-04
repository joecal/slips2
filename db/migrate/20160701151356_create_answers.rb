class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body
      t.integer :user_id
      t.references :question, index: true, foreign_key: true
    end
  end
end
