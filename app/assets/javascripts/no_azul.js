window.NoAzul = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
   var router = new Router();
   Backbone.history.start();
  }
};

$(document).ready(function(){
  NoAzul.initialize();
});
