class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|

      t.integer :orde_id,             null: false, default: ""
      t.integer :item_id,             null: false, default: ""
      t.integer :price,               null: false, default: ""
      t.integer :amount,              null: false, default: ""
      t.integer :make_status,         null: false, default: "0"

      t.timestamps
    end
  end
end
