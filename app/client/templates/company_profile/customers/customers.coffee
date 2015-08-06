Template.Customers.helpers
  allCust: () ->
    _.map Template.currentData().CompanyInfo.customers, (item, index) ->
      newCust =
        afId: "companyCustomer#{index}"
        fieldName: "customers.#{index}.name"
        value: item

Template.CustomerItem.events
  'click [data-action="remove-customer"]': (e) ->
    e.preventDefault()
    console.log Template.currentData()
    Companies.update(
        { _id: Companies.findOne()._id },
        { $pull: 
            { customers: 
                {name: Template.currentData().value.name } }
        }
    )


Template.Customers.events
  'click .add-customer': (e) ->
    e.preventDefault()
    console.log "clicked"
    $('.customer-popover').toggle()