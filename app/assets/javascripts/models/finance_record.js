var FinanceRecord = Backbone.Model.extend({urlRoot: "/finance",
  defaults: {
  	value: 0,
  	expense: true,
  	processed: false
  }
});