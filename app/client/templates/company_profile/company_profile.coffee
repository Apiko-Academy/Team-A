Template.CompanyProfileMenuItem.events
  "click .menu-btn": (e) ->
    $('.com-pr-con').hide()
    console.log "menu clicked"
    $('.' + Template.currentData().section).show()

Template.CompanyProfile.events
  'click .del-com-btn': (e) ->
    e.preventDefault()
    console.log Template.currentData().CompanyInfo._id
    Companies.remove _id: Template.currentData().CompanyInfo._id, (err) ->
      if(err)
        sAlert.error err.message
        Winston.error err.message
    Router.go 'userProfile'