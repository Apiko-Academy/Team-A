Meteor.users.attachSchema schemas.User

Meteor.user._transform = (user) ->
  if _.isObject user.profile
    companies = _.map user.profile.companies, (companyId) ->
      Companies.findOne _id: companyId
    user.profile.companies = companies
  user
