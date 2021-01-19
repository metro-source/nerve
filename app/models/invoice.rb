class Invoice < ApplicationRecord
    has_many :billed_items
    belongs_to :client

    def total_seconds
        total = 0

        billed_items.each { |billed_item|
            hours, minutes, seconds = billed_item.duration.split(':').map(&:to_i)

            total += (hours.hours + minutes.minutes + seconds.seconds)
        }

        total
    end

    def total_time
        time = total_seconds

        hours, time = time.divmod(1.hour.to_i)
        minutes, time = time.divmod(1.minute.to_i)
        seconds =  time

        return "#{format("%02d", hours)}:#{format("%02d", minutes)}:#{format("%02d", seconds)}"
    end
end
