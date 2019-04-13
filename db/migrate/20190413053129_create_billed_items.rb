class CreateBilledItems < ActiveRecord::Migration[5.2]
  def change
    create_table :billed_items do |t|
      t.string :title
      t.integer :price
      t.string :duration
      t.integer :rate_cents
      t.integer :invoice_id
    end

    add_index :billed_items, :invoice_id
  end
end
