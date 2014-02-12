var FinanceRecordView = Backbone.View.extend({
	tagName: 'tr',
	events: {
      'click' : 'toogleModel'
	},
	className: function(){
		str_class = 'finance-record';
        str_class += this.model.get("expense") ? ' finance-record-expense ' : ' finance-record-income';
        str_class += this.model.get("processed") ? ' finance-record-processed' : ' finance-record-unprocessed';
	    return str_class;
	},
	financeTemplate: JST.finance_record,
	render: function(){
		this.$el.html( this.financeTemplate(this.model.toJSON()) );
		this.$el.attr('class',this.className());
		return this;
	},
	toogleModel: function(){
		this.model.set({expense: !this.model.get("expense")});
		this.model.save(this.model.attributes,{patch:true});
		this.render();
	}
});