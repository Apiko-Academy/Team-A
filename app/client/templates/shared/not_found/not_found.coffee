Template.NotFound.onCreated ->
  url = Iron.Location.get().path
  Winston.warn "Request to non-existing url #{url}"