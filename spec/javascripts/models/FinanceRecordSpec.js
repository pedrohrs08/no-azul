describe("FinanceRecord", function(){
    var financeRecord;

	beforeEach(function(){
	 financeRecord = new FinanceRecord();
	});

    it("Finance Record should not be null", function(){
        expect(financeRecord).not.toEqual(null)
    });

it("Finance Record model url should point to financeRecord endpoint", function(){
    expect(financeRecord.url()).toEqual("/finance");
});
    
it("Finance Record should have the following default values", function(){
   expect(financeRecord.get("value")).toEqual(0);
   expect(financeRecord.get("expense")).toEqual(true)
   expect(financeRecord.get("processed")).toEqual(false);
});

/*it("Should fetch finance record from server based on its id", function(){
	expect(4);
	this.financeRecord.set({ id: 1 });
	this.financeRecord.fetch({ success: function(user){
        equal(user.get("description"), "Supermarket", "description doesnt match with the server");
        equal(user.get("expense"),true,"expense status doesnt match");
        equal(user.get("processed"),true,"processed status doesnt match");
        equal(user.get("value"),10.00,"value doesnt match");
        start();
	}});
});*/

it("Should validate finance record", function(){
    expect(financeRecord.isValid()).toEqual(false);
    expect(financeRecord.validationError).toEqual("Description must be set");
    financeRecord.set({description: "Mock description"});
    expect(financeRecord.isValid()).toEqual(false);
    expect(financeRecord.validationError).toEqual("Value must be greater than 0");
    financeRecord.set({value: 10.00});
    expect(financeRecord.isValid()).toEqual(true);
});

});



