class CreateAutopilotModels < ActiveRecord::Migration
  def change
    create_table :autopilot_models do |t|

      t.timestamps
    end
  end
end
