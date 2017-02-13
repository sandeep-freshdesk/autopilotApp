class CreateAutopilotModels < ActiveRecord::Migration
  def self.up
    create_table :autopilot_models do |t|
      t.string :FirstName
      t.string :LastName
      t.string :Email
      t.string :_NewEmail
      t.timestamps
    end
  end

  def self.down
  	drop_table :autopilot_models
  end
end
