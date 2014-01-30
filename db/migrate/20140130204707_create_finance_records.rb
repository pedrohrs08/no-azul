class CreateFinanceRecords < ActiveRecord::Migration
  def change
    create_table :finance_records do |t|
      t.string :description
      t.float :value
      t.date :date
      t.boolean :expense

      t.timestamps
    end
  end
end
