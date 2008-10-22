class CreateHeaders < ActiveRecord::Migration
  def self.up
    create_table :headers do |t|
      t.string :title
      t.string :subtitle
      t.string :layout
      t.string :organization_uid
      t.string :asset_type
      t.string :asset_urn

      t.timestamps
    end
    add_index :headers, :organization_uid
  end

  def self.down
    drop_table :headers
  end
end
