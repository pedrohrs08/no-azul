class AddProcessedToFinanceRecord < ActiveRecord::Migration
  def change
    add_column :finance_records, :processed, :boolean
  end
end
