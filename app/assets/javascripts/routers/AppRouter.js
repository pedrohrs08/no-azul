var Router = Backbone.Router.extend({
	routes: {
	   "" : "index"
	},
	index: function(){
       this.financeRecords = new FinanceRecords();
       this.financeRecordsView = new StatementView({model: this.financeRecords});
       this.financeRecords.fetch({data: {from: '1999-1-1',to: '2013-1-1'},reset:true});
       $("#container").html(this.financeRecordsView.render().el);
	}
});