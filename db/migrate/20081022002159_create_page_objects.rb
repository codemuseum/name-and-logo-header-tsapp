class CreatePageObjects < ActiveRecord::Migration
  def self.up
    create_table :page_objects do |t|
      t.string :urn
      t.references :header

      t.timestamps
    end
    add_index :page_objects, :urn
    add_index :page_objects, :header_id
  end

  def self.down
    drop_table :page_objects
  end
end
