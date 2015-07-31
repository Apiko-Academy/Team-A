# Template.CompanyInfo.onRendered () ->
#   @$('[data-toggle="tooltip"]').tooltip()

Template.CompanyInfo.events
  'click [data-action="remove-company"]': (e) ->
    e.preventDefault()
    console.log 'remove company'
    Companies.remove _id: @_id, (err) ->
      if(err)
        sAlert.error err.message
        Winston.error err.message
