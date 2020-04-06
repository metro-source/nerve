class MoveInvoiceClients < ActiveRecord::Migration[5.2]
  def up
    names = Invoice.group(:client_name).pluck(:client_name)
    names.each do |name|
      client = Client.create(name: name)

      Invoice.where(client_name: name).update_all(client_id: client.id)
    end
  end

  def down
    Invoice.where.not(client_name: nil).update_all client_id: nil
  end
end
