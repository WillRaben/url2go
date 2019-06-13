class CreateLongUris < ActiveRecord::Migration[5.2]
  def change
    create_table :long_uris, id: :bigint do |t|
      t.text :org_url, :null => false, :unique => true
      t.string :short_url, :default => ""
      t.integer :protocol_id, :default => 0 #0 => http:// , 1 => https://
      t.bigint :hits, :default => 0

      t.timestamps
    end
    add_index :long_uris, :org_url 
    add_index :long_uris, :short_url
    add_index :long_uris, :hits
  end
end
