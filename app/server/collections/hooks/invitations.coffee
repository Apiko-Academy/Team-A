Invitations.after.insert (userId, doc) ->
    Winston.info """
    Invitation \"#{doc._id}\ created by \"#{userId}\"
    """

Invitations.after.update (userId, doc) ->
    Winston.info """
    Invitation \"#{doc._id}\ updated by \"#{userId}\"
    """
Invitations.after.remove (userId, doc) ->
    Winston.info """
    Invitation \"#{doc._id}\ removed by \"#{userId}\"
    """
