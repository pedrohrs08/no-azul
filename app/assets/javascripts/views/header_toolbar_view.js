var HeaderToolbarView = Backbone.View.extend({
    tagName: 'header',
	className: "navbar navbar-static-top navbar-inverse bs-docs-nav",
	events: {
		'click a#finance-records' : 'navigateToFianceRecords'
	},
	render: function (argument) {
       this.$el.attr('role', 'banner');
       this.$el.html(JST.header_toolbar_template());
       return this;
	},
	navigateToFianceRecords: function(){
		Backbone.history.navigate('finance-records',{trigger: true});
	}
});