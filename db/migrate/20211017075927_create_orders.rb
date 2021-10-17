class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id,                 null: false, default: ""
      t.string :mailing_address_postal_code,  null: false, default: ""
      t.string :mailing_address,              null: false, default: ""
      t.string :mailing_address_name,         null: false, default: ""
      t.integer :billing,                     null: false, default: ""
      t.integer :postage,                     null: false, default: ""
      t.integer :payment_method,              null: false, default: "0"
      t.integer :status,                      null: false, default: "0"

      t.timestamps
    end
  end
end
