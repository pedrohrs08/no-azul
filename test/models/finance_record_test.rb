require 'test_helper'

class FinanceRecordTest < ActiveSupport::TestCase
   test "should respond to fields" do
     record = FinanceRecord.new
     record.should respond_to 'description'
     record.should respond_to 'value'
     record.should respond_to 'date'
     record.should respond_to 'description'
     record.should respond_to 'expense?'
   end

   test "should respond to scope methods" do
      FinanceRecord.should respond_to 'from_date'
      FinanceRecord.should respond_to 'to_date'
   end
   
   test "should only return records from a given date" do
      finance_records = FinanceRecord.from_date(Date.new(2000,1,1))
      finance_records.should have(2).items
      finance_records[0].date.should > Date.new(2000-1-1)
   end

   test "should only return records to a given date" do
      finance_records = FinanceRecord.to_date(Date.new(2000,1,1))
      finance_records.should have(2).items
      finance_records.each do |finance_record|
      	finance_record.date.should <= Date.new(2000,1,1)
      end
   end
end
