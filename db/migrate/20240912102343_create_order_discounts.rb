class CreateOrderDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_discounts do |t|
      t.references :order, null: false, foreign_key: true
      t.string :description
      t.integer :amount

      t.timestamps
    end
  end
end
