Companies.after.insert (userId, doc) ->
  user = Meteor.users.findOne _id: userId
  if Meteor.isServer and user
    Meteor.users.update userId, $push:
     'profile.companies': doc._id
