Companies.after.insert (userId, doc) ->
    Winston.info """
    Company \"#{doc._id}\ created by \"#{userId}\"
    """

Companies.after.update (userId, doc) ->
    Winston.info """
    Company \"#{doc._id}\ updated by \"#{userId}\"
    """
Companies.after.remove (userId, doc) ->
    Winston.info """
    Company \"#{doc._id}\ removed by \"#{userId}\"
    """

Companies.after.insert (userId, doc) ->
  user = Meteor.users.findOne _id: userId
  if Meteor.isServer and user
    Meteor.users.update userId, $push:
     'profile.companies': doc._id
