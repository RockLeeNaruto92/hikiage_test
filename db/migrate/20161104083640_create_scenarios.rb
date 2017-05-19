class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.string :name
      t.string :type

      t.timestamps null: false
    end
  end
end
