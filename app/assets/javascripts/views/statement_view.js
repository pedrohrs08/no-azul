var StatementView = Backbone.View.extend({
	tagName: 'table',
	className: 'table',
	initialize: function(){
		this.model.bind("reset", this.render, this);
        this.$el.append(JST.finance_records({date: "Date", description: "Description", value: "Value"}));
	},
	render: function () {
	 _.each(this.model.models,function(financeRecord){
		var financeRecordView = new FinanceRecordView({model: financeRecord});
		this.$el.append(financeRecordView.render().el);
	 }, this);
	 return this;
	}
});