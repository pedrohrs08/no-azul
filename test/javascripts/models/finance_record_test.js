module("Finance Record model test", {
	setup: function(){
		this.financeRecord = new FinanceRecord();
	}
})

test("Finance Record should not be null", function(){
    notEqual(this.financeRecord, null,"Finance record is null");
});

test("Finance Record model url should point to financeRecord endpoint", function(){
    equal(this.financeRecord.url(),"/finance","Finance record not pointing to correct url");
});

test("Finance Record should have the following default values", function(){
   equal(this.financeRecord.get("value"),0,"Default value for value is not zero");
   equal(this.financeRecord.get("expense"),true,"Default value for expense should be true");
   equal(this.financeRecord.get("processed"),false,"Default value for processed shoud be false");
});

asyncTest("Should fetch finance record from server based on its id", function(){
	expect(4);
	this.financeRecord.set({ id: 1 });
	this.financeRecord.fetch({ success: function(user){
        equal(user.get("description"), "Supermarket", "description doesnt match with the server");
        equal(user.get("expense"),true,"expense status doesnt match");
        equal(user.get("processed"),true,"processed status doesnt match");
        equal(user.get("value"),10.00,"value doesnt match");
        start();
	}});
});

test("Should validate finance record", function(){
    equal(this.financeRecord.isValid(),false,"record should not be valid");
    equal(this.financeRecord.validationError,"Description must be set");
    this.financeRecord.set({description: "Mock description"});
    equal(this.financeRecord.isValid(),false,"record should not be valid");
    equal(this.financeRecord.validationError,"Value must be greater than 0");
    this.financeRecord.set({value: 10.00});
    equal(this.financeRecord.isValid(),true,"record should be valid");
});