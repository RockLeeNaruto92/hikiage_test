# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..1000).each do |n|
  scenario = Scenario.create name: "scenario #{n}"
  action = Action.create name: "action #{n}", test_column: n.to_s
  ScenarioAction.create scenario_id: scenario.id, action_test_column: action.test_column
end
