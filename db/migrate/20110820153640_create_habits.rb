class CreateHabits < ActiveRecord::Migration
  def self.up
    create_table :habits do |t|
      t.string :name
      t.integer :days, :default => 0
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :habits
  end
end
