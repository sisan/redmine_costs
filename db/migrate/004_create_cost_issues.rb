class CreateCostIssues < ActiveRecord::Migration
  def change
    create_table :cost_issues do |t|
      t.decimal :value, :precision => 14, :scale => 2
      t.integer :issue_id
    end
  end
end
