class FinanceRecord < ActiveRecord::Base
    validates :description, presence: true
    validates :date, presence: true
    validates :value, presence: true

	def multiplier
		expense? ? -1 : 1
	end
	
    scope :sum_processed, ->{incomes.processed.sum('value') - expenses.processed.sum('value')}
    scope :sum_unprocessed, ->{incomes.unprocessed.sum('value') - expenses.unprocessed.sum('value')}
	scope :expenses, ->{where('expense == ?', true)}
	scope :incomes, ->{where('expense == ?',false)}
	scope :processed, ->{where('processed == ?', true)}
	scope :unprocessed, ->{where('processed == ?', false)}  
	scope :from_date, ->(date){ where('date >= ?', date)}
	scope :to_date, ->(date){ where('date <= ?', date)}
end
