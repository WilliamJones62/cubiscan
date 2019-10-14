class CreateScanLists < ActiveRecord::Migration[5.2]
  def change
    create_table :scan_lists do |t|
      t.string :part_code
      t.boolean :scanned

      t.timestamps
    end
  end
end
