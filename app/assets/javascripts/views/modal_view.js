var ModalView = Backbone.View.extend({
	 className: 'modal show',
	 id: 'myModal',
	 events: {
       'click .close' : 'closeModal',
       'click .create' : 'triggerAdd',
       'click .cancel' : 'render'
	 },
	 initialize: function(){
		this.$el.draggable({
			cursor: "crosshair"
		});
	 },
	modalTemplate: JST.modal_template, 
	render: function(){
		this.model.addView.remove();
		this.$el.html(this.modalTemplate({title: this.model.title, heading: this.model.heading}));
		this.$("#content").html(this.model.view.render().el);
		this.$('#footer').html(JST.list_footer_buttons());
		return this;
	},
	closeModal: function () {
		this.remove();
		Backbone.history.navigate("/");
	},
	triggerAdd: function() {
		this.model.view.remove();
		this.$("#content").html(this.model.addView.render().el);
		this.$('#footer').html(JST.form_footer_buttons());
		return this;
	}
});