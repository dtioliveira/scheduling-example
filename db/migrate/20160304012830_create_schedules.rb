class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :attendance

      t.timestamps null: false
    end
  end
end
