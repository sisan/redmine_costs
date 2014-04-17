class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
         t.integer :project_id
         t.decimal :value, :precision => 14, :scale => 2
         t.date :start_date
         t.date :end_date
    end
  end
end
