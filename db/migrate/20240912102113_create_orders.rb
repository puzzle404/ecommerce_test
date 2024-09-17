class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :total_without_discounts
      t.integer :total_with_discounts

      t.timestamps
    end
  end
end
