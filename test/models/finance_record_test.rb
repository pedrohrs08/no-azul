require 'test_helper'

class FinanceRecordTest < ActiveSupport::TestCase
   test "should respond to fields" do
     record = FinanceRecord.new
     record.should respond_to 'description'
     record.should respond_to 'value'
     record.should respond_to 'date'
     record.should respond_to 'description'
     record.should respond_to 'expense?'
     record.should respond_to 'multiplier'
     record.should respond_to 'processed'
   end

   test "should respond to scope methods" do
      FinanceRecord.should respond_to 'from_date'
      FinanceRecord.should respond_to 'to_date'
      FinanceRecord.should respond_to 'sum_processed'
      FinanceRecord.should respond_to 'sum_unprocessed'
      FinanceRecord.should respond_to 'processed'
      FinanceRecord.should respond_to 'unprocessed'
      FinanceRecord.should respond_to 'expenses'
      FinanceRecord.should respond_to 'incomes'
   end
   
   test "should only return records from a given date" do
      finance_records = FinanceRecord.from_date(Date.new(2000,1,1))
      finance_records.should have(4).items
      finance_records[0].date.should > Date.new(2000-1-1)
   end

   test "should only return records to a given date" do
      finance_records = FinanceRecord.to_date(Date.new(2000,1,1))
      finance_records.should have(2).items
      finance_records.each do |finance_record|
      	finance_record.date.should <= Date.new(2000,1,1)
      end
   end

   test "multiplier should be -1 for expenses" do
     finance_record = FinanceRecord.find_by_description('Supermarket')
     finance_record.multiplier.should eq -1
   end

   test "multiplier should be 1 for incomes" do
     finance_record = FinanceRecord.find_by_description('Salary')
     finance_record.multiplier.should eq 1
   end

   test "should sum only processed records" do
      sum = FinanceRecord.sum_processed
      sum.should eq 466.0
   end

   test "should sum only unprocessed records" do
      sum = FinanceRecord.sum_unprocessed
      sum.should eq 1000.00
   end

   test "should only return expenses records" do
       FinanceRecord.expenses.each do |finance_record|
          finance_record.expense?.should be_true
       end
   end

   test "should only return income records" do
       FinanceRecord.incomes.each do |finance_record|
          finance_record.expense?.should be_false
       end
   end

   test "should only return processed records" do
       FinanceRecord.processed.each do |finance_record|
          finance_record.processed?.should be_true
       end
   end

   test "should only return unprocessed records" do
       FinanceRecord.unprocessed.each do |finance_record|
          finance_record.processed?.should be_false
       end
   end

   test "should not be valid if description is blank" do
        finance_record = FinanceRecord.all.first
        finance_record.description = nil
        finance_record.should_not be_valid
   end

   test "should not be valid if date is blank" do
        finance_record = FinanceRecord.all.first
        finance_record.date = nil
        finance_record.should_not be_valid
   end

   test "should not be valid if value is blank" do
        finance_record = FinanceRecord.all.first
        finance_record.value = nil
        finance_record.should_not be_valid
   end
end
