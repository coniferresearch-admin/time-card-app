class AddClockInAndClockOutToPunches < ActiveRecord::Migration
  def change
    add_column :punches, :clock_in, :datetime
    add_column :punches, :clock_out, :datetime
  end
end
