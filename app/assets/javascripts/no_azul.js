window.NoAzul = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
   var router = new Router();
   Backbone.history.start({pushState: true});
  }
};

$(document).ready(function(){
  NoAzul.initialize();
});
