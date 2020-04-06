class Invoice < ApplicationRecord
    has_many :billed_items
    belongs_to :client
end
