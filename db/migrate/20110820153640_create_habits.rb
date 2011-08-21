class CreateHabits < ActiveRecord::Migration
  def self.up
    create_table :habits do |t|
      t.string :name
      t.integer :days, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :habits
  end
end
