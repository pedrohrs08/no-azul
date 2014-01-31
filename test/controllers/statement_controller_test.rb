require 'test_helper'

class StatementControllerTest < ActionController::TestCase
   test "should not get finance records if no parameter is passed" do
     get :finances
     assigns[:finances].should be_nil
   end

   test "should not get finance records if only 'from' parameter is passed" do
   	get :finances, {'from' => '2000-01-01'}
   	assigns[:finances].should be_nil
   end

   test "should not get finance records if only 'to' parameter is passed" do
   	get :finances, {'to' => '2000-01-01'}
   	assigns[:finances].should be_nil
   end

   test "should get finance records if parameter is passed" do
   	get :finances, {'to' => '2000-01-01', 'from' => '1999-01-01'}
   	assigns[:finances].should_not be_nil
   	assigns[:finances].each do |finance|
   	  finance.date.should <= Date.new(2000,01,01)
   	  finance.date.should >= Date.new(1999,01,01)
   	end
   end
end
