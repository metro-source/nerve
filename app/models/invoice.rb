class Invoice < ApplicationRecord
    has_many :billed_items
end
