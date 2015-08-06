Template.CompanyProfileMenuItem.events
  "click .menu-btn": (e) ->
    $('.com-pr-con').hide();
    console.log "menu clicked";
    $('.' + Template.currentData().section).show();