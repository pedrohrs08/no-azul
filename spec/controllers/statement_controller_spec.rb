require 'spec_helper'

describe StatementController do
   before(:each) do
      create(:finance_record, date: Date.new(1999,1,1), id: 1)
      create(:finance_record, date: Date.new(2000,1,1), id: 2)
      create(:finance_record, date: Date.new(2001,1,1), id: 3)
      request.headers["Accept"] = "application/json"
   end

   it "should not get finance records if no parameter is passed" do
     get :finances
     assigns[:finances].should be_nil
   end

   it "should not get finance records if only 'from' parameter is passed" do
    get :finances, {'from' => '2000-01-01'}
    assigns[:finances].should be_nil
   end

   it "should not get finance records if only 'to' parameter is passed" do
    get :finances, {'to' => '2000-01-01'}
    assigns[:finances].should be_nil
   end

   it "should get finance records if parameter is passed" do
    get :finances, {'to' => '2000-01-01', 'from' => '1999-01-01'}
    assigns[:finances].should_not be_nil
    assigns[:finances].each do |finance|
      finance.date.should <= Date.new(2000,01,01)
      finance.date.should >= Date.new(1999,01,01)
    end
   end

   it "should get finance record based on its id" do
     get :finance, {"id" => "1"}
     assigns[:finance].should_not be_nil
     assigns[:finance].id.should eq 1
   end
end
