class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.integer :rating, null: false, default: 0
      t.integer :user_id, null: false
      t.integer :answer_id, null: false
      
      t.timestamps
    end
  end
end
