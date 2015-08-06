Template.Customers.helpers
  allCust: () ->
    _.map Template.currentData().CompanyInfo.customers, (item, index) ->
      newCust =
        afId: "companyCustomer#{index}"
        fieldName: "customers.#{index}.name"
        value: item

Template.Customers.events
  'click [data-action="remove-customer"]': (e) ->
    e.preventDefault()
    console.log $(event.target).data('field')
    Companies.update(
        { _id: Companies.findOne()._id },
        { $pull: 
            { customers: 
                {name: $(event.target).data('field') } }
        }
    )
    
