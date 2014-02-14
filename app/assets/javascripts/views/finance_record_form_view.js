var FinanceRecordFormView = Backbone.View.extend({
	formTemplate: JST.finance_record_form_template,
	initialize: function(){
	},
	render: function () {
		this.$el.html(JST.finance_record_form_template());
        this.$('#value').maskMoney({
			prefix: 'R$ ', 
			allowNegative: false,
			thousands: '.',
			decimal: ',',
			affixesStay: true
		});
		return this;
	}
});