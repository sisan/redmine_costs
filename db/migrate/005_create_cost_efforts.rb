class CreateCostEfforts < ActiveRecord::Migration
  def change
    create_table :cost_efforts do |t|
      t.integer :project_id
      t.string :number
    end
  end
end
