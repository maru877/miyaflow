class AddColumnResolvedAtToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :resolved_at, :datetime
  end
end
