Template.Popup.events({
  "click .to-click": function(e){
    var tpl = Template.instance();
    $('content').css("background-color","#f5f5f5");
    tpl.$('.popup').toggle();
  }
});


Template.Popup.onRendered(function () {
  var self = this;
  AutoForm.addHooks([self.data.afId], {
    onSuccess: function () {
      self.$('.popup').toggle();
    }
  });
});
    // Template.currentData().text
    // Template.instance().data().text
