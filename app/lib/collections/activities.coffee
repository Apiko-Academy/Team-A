@Activities = new Mongo.Collection 'activities'

Activities.allow
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

Activities.deny
  insert: denyChecker
  update: denyChecker
  remove: denyChecker

Activities.attachSchema schemas.Activity
