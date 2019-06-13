class CreateTopHits < ActiveRecord::Migration[5.2]
  def change
    create_table :top_hits do |t|
      t.string :title
      t.string :short_url
      t.integer :hits

      t.timestamps
    end
  end
end
