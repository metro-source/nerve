class InvoiceController < ApplicationController
    require 'csv'

    def index
        # Show some invoicing stats
        @invoice_count = Invoice.count
        @total_billed = Invoice.sum("total_cents")/100.0
        @client_count = Client.count
    end

    def create_invoice
        csv_file = params[:csv].read
        csv_data = CSV.parse csv_file, headers: true
        invoice = Invoice.create(client_name: params[:client_name], slug: SecureRandom.hex(20))
        invoice.total_cents = 0
        
        csv_data.each do |row|
            item = invoice.billed_items.new
            item.title = row["Title"]
            item.duration = row["Duration"]

            duration_vals = item.duration.split(":").map(&:to_i)
            hours = (duration_vals[0] + duration_vals[1]/60.0 + duration_vals[2]/3600.0).round(3)

            item.rate_cents = 2500

            item.price = hours * item.rate_cents
            invoice.total_cents += item.price

            item.save
        end

        invoice.client = Client.find_or_create_by name: invoice.client_name 

        invoice.save

        redirect_to "/invoice/#{ invoice.slug }"
    end

    def invoice
        @invoice = Invoice.find_by_slug params[:slug]
        @bch_address = Rails.configuration.bch_address
    end
end