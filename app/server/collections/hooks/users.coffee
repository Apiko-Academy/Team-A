Meteor.users.after.insert (userId, doc) ->
  if userId
    Winston.info """
    User \"#{doc._id}\ created by \"#{userId}\"
    """
  else
    Winston.info """
    User \"#{doc._id}\ has been created"
    """

Meteor.users.after.update (userId, doc) ->
  if userId
    Winston.info """
    User \"#{doc._id}\ updated by \"#{userId}\"
    """
  else
      Winston.info """
      User \"#{doc._id}\ has been updated"
      """

Meteor.users.after.remove (userId, doc) ->
  if userId
    Winston.info """
    User \"#{doc._id}\ removed by \"#{userId}\"
    """
  else
    Winston.info """
    User \"#{doc._id}\ has been removed"
    """
