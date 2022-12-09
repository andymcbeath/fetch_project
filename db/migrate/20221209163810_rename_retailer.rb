class RenameRetailer < ActiveRecord::Migration[7.0]
  def change
    rename_column :receipts, :reatailer, :retailer
  end
end
