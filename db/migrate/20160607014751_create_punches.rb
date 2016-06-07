class CreatePunches < ActiveRecord::Migration
  def change
    create_table :punches do |t|
      t.string :event_type
      t.integer :user_id
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
