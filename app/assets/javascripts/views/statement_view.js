var StatementView = Backbone.View.extend({
	tagName: 'div',
	className: 'statement',
	initialize: function(){
		this.model.bind("reset", this.render, this);
	},
	render: function () {
	 _.each(this.model.models,function(financeRecord){
		var financeRecordView = new FinanceRecordView({model: financeRecord});
		this.$el.append(financeRecordView.render().el);
	 }, this);
	 return this;
	}
});