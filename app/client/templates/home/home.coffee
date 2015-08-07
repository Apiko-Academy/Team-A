Template.Home.events
  'click [data-action="sign-up"]' : (e) ->
    e.preventDefault()
    Meteor.logout()
    trackerComputation = Tracker.autorun () ->
      if not Meteor.userId()
        if trackerComputation
          trackerComputation.stop()
        Router.go 'atSignUp'

