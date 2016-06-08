class RemoveEventTypeFromPunches < ActiveRecord::Migration
  def change
    remove_column :punches, :event_type, :string
  end
end
