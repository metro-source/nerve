class AddClientIdToInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :client_id, :integer
    add_index :invoices, :client_id
  end
end
