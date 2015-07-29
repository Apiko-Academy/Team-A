Activities.after.insert (userId, doc) ->
    Winston.info """
    Activity \"#{doc._id}\ created by \"#{userId}\"
    """

Activities.after.update (userId, doc) ->
    Winston.info """
    Activity \"#{doc._id}\ updated by \"#{userId}\"
    """
Activities.after.remove (userId, doc) ->
    Winston.info """
    Activity \"#{doc._id}\ removed by \"#{userId}\"
    """
