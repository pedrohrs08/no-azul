require 'spec_helper'

describe FinanceRecord do
   describe "validation" do
     before (:all) do
        @finance_record = build(:finance_record)
     end
     it "should not be valid if description is blank" do
          @finance_record.description = nil
          @finance_record.should_not be_valid
     end

     it "should not be valid if date is blank" do     
          @finance_record.date = nil
          @finance_record.should_not be_valid
     end

     it "should not be valid if value is blank" do
          @finance_record.value = nil
          @finance_record.should_not be_valid
     end
   end

   describe "methods" do     
     subject { @record = FinanceRecord.new }

     it "should respond to fields" do
       should respond_to 'description'
       should respond_to 'value'
       should respond_to 'date'
       should respond_to 'description'
       should respond_to 'expense?'
       should respond_to 'multiplier'
       should respond_to 'processed'
     end
    
     it "should respond to scope methods" do
        FinanceRecord.should respond_to 'from_date'
        FinanceRecord.should respond_to 'to_date'
        FinanceRecord.should respond_to 'sum_processed'
        FinanceRecord.should respond_to 'sum_unprocessed'
        FinanceRecord.should respond_to 'processed'
        FinanceRecord.should respond_to 'unprocessed'
        FinanceRecord.should respond_to 'expenses'
        FinanceRecord.should respond_to 'incomes'
     end
     
     it "multiplier should be -1 for expenses" do
      finance_record = build(:finance_record, :expense)
      finance_record.multiplier.should eq -1
     end

     it "multiplier should be 1 for incomes" do
       finance_record = build(:finance_record)
       finance_record.multiplier.should eq 1
     end
  end  

  describe "scopes" do
    before(:each) do
      create(:finance_record, :expense, date: Date.new(1999,1,1), value: 10.00)
      create(:finance_record, :processed, date: Date.new(2000,1,1), value: 2000.00)
      create(:finance_record,date: Date.new(2001,1,1), value: 35.00)
    end

    it "should only return records to a given date" do
      finance_records = FinanceRecord.to_date(Date.new(2000,1,1))
      finance_records.should have(2).items
      finance_records.each do |finance_record|
        finance_record.date.should <= Date.new(2000,1,1)
      end
    end

    it "should only return records from a given date" do
      finance_records = FinanceRecord.from_date(Date.new(2000,1,1))
      finance_records.should have(2).items
      finance_records[0].date.should >= Date.new(2000,1,1)
    end

    it "should only return expenses records" do
       FinanceRecord.expenses.each do |finance_record|
          finance_record.expense?.should be_true
       end
    end

   it "should only return income records" do
       FinanceRecord.incomes.each do |finance_record|
          finance_record.expense?.should be_false
       end
   end

   it "should only return processed records" do
       FinanceRecord.processed.each do |finance_record|
          finance_record.processed?.should be_true
       end
   end

   it "should only return unprocessed records" do
       FinanceRecord.unprocessed.each do |finance_record|
          finance_record.processed?.should be_false
       end
   end

   it "should sum only processed records" do
      create(:finance_record,:processed,:expense,value: 10.00)
      sum = FinanceRecord.sum_processed
      sum.should eq 1990.0
   end

   it "should sum only unprocessed records" do
      sum = FinanceRecord.sum_unprocessed
      sum.should eq 25.00
   end
  end 
end
