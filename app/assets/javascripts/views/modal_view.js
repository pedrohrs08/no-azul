var ModalView = Backbone.View.extend({
	 className: 'test',
	 id: 'myModal',
	 events: {
       'click .close' : 'closeModal'
	 },
	 initialize: function(){
		this.$el.draggable({
			cursor: "crosshair"
		});
	 },
	modalTemplate: JST.modal_template, 
	render: function(){
		this.$el.html(this.modalTemplate({title: this.model.title, heading: this.model.heading}));
		this.$("#body").append(this.model.view.render().el);
		return this;
	},
	closeModal: function () {
		this.remove();
		Backbone.history.navigate("/");
	}
});