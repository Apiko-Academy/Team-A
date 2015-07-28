@Activity = new Mongo.Collection 'activity'

Activity.allow
  insert: -> true
  update: -> true
  remove: -> true

denyChecker = (userId) ->
  deny = not Meteor.userId()
  if deny
    Winston.warn '''
      non-authorized user tries to get access to activity collection
    '''
  deny

Activity.deny
  insert: denyChecker
  update: denyChecker
  remove: denyChecker

Activity.attachSchema schemas.Activity
