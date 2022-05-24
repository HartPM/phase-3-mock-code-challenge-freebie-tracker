class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        if self.freebies.find_by(item_name: item_name)
            true
        else
            false
        end
    end

    def give_away(dev, freebie)
        if self.freebies.find_by(dev_id: self.id)
            freebie.update(dev_id: dev.id)
            "#{self.name} gave away a freebie!"
        else
            "#{self.name} doesn't own that freebie!"
        end
    end
end
