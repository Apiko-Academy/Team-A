Template.UserProfile.helpers
  userEmail: () ->
    if Meteor.user()
      Meteor.user().emails[0].address
  userRole: () ->
    user = Meteor.user()
    if Roles.userIsInRole user._Id, 'admin'
      'Owner'
    else if user.profile.companies.length
      'invited User'
    else
      'None'

  userInitials: () ->
    fullname = Meteor.user().profile.fullname
    [x[0].upper() for x in fullname.split(' ')].join('')
    fullname = ''
    for word in Meteor.user().profile.fullname.split(' ')
      fullname += word[0].toUpperCase()
    fullname
