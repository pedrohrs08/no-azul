class FinanceRecord < ActiveRecord::Base

	scope :from_date, ->(date){ where('date >= ?', date) }
	scope :to_date, ->(date){ where('date <= ?', date)}
end
