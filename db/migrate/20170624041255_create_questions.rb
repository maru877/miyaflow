class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :is_resolution, null: false, default: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
