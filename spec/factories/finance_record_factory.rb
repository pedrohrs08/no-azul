FactoryGirl.define do 
  factory :finance_record, class: FinanceRecord do
 	 description 'Salary'
 	 value 1000.00
 	 date Date.new(2001,1,1)
     expense false
     processed false

 	 trait :expense do
 	 	expense true
 	 end

 	 trait :processed do
 	   processed true
  	 end	
  end
end