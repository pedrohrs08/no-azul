module("Finance Record model test", {
	setup: function(){
		this.financeRecord = new FinanceRecord();
	}
})

test("Finance Record should not be null", function(){
    notEqual(this.financeRecord, null,"Finance record is null");
});

test("Finance Record model url should point to financeRecord endpoint", function(){
    equal(this.financeRecord.url(),"/financeRecord","Finance record not pointing to correct url");
});