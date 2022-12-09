class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts do |t|
      t.string :reatailer

      t.timestamps
    end
  end
end
