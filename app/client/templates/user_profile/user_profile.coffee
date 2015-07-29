Template.UserProfile.helpers
  userEmail: () ->
    if Meteor.user()
      Meteor.user().emails[0].address
  userRole: () ->
    user = Meteor.user()
    if Roles.userIsInRole user._id, 'admin'
      'Admin'
    else if user.profile.companies.length
      
      'invited User'
    else
      'None'

  userInitials: () ->
    fullname = Meteor.user().profile.fullname
    [x[0].toUpperCase() for x in fullname.split(' ')].join('')
