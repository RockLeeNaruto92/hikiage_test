class CreateScenarioActions < ActiveRecord::Migration
  def change
    create_table :scenario_actions do |t|
      t.integer :scenario_id
      t.string :action_test_column

      t.timestamps null: false
    end

    add_index :scenario_actions, [:scenario_id, :action_test_column,]
  end
end
