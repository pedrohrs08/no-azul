class FinanceRecord < ActiveRecord::Base

	def multiplier
		expense? ? -1 : 1
	end

	scope :from_date, ->(date){ where('date >= ?', date) }
	scope :to_date, ->(date){ where('date <= ?', date)}
end
