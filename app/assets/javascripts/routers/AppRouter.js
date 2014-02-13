var Router = Backbone.Router.extend({
	routes: {
	   "" : "index",	
	   "finance-records" : "financeRecords"
	},
	initialize: function(){
        this.buildHeader();
	},
	index: function(){

	},
	financeRecords: function(){
       this.financeRecords = new FinanceRecords();
       this.financeRecordsView = new StatementView({model: this.financeRecords});
       this.financeRecords.fetch({data: {from: '1999-1-1',to: '2013-1-1'},reset:true});
       this.model = {
			title: "This is your monthly statement",
			heading: "Statement List",
			view: this.financeRecordsView
       };
       this.modal = new ModalView({model: this.model});
       $("body").append(this.modal.render().el);		
	},
	buildHeader: function(){
			this.headerView = new HeaderToolbarView({model: this});
			$("body").append(this.headerView.render().el);	
	}
});