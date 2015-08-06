Template.Popup.events({
  "click .to-click": function(e){
    var tpl = Template.instance();
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
  console.log('Template.Popup.data', self.data);
});
    // Template.currentData().text
    // Template.instance().data().text
