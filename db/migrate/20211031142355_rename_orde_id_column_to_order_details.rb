class RenameOrdeIdColumnToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_details, :orde_id, :order_id
  end
end
