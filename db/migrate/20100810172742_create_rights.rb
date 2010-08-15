class CreateRights < ActiveRecord::Migration
  def self.up
    create_table :rights do |t|
      t.integer :user_id
      t.integer :project_id
      t.boolean :owner
      t.boolean :read
      t.boolean :write

      t.timestamps
    end
  end

  def self.down
    drop_table :rights
  end
end
