var FinanceRecord = Backbone.Model.extend({urlRoot: "/finances",
  defaults: function() {
    return {
      value: 0,
      expense: true,
      processed: false,
      description: ""
   }; 
  },
  validate: function(attributes){
    if(attributes.description === ""){
      return "Description must be set";
    }
    if(attributes.value <= 0){
      return "Value must be greater than 0";
    }
  }
});