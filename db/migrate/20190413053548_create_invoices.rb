class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :slug, limit: 40
      t.string :client_name
      t.integer :total_cents
      t.integer :status, default: 0
    end

    add_index :invoices, :slug
  end
end
