Template.Customers.helpers
  allCust: () ->
    _.map Template.currentData().CompanyInfo.customers, (item, index) ->
      newCust =
        index: index+1
        afId: "companyCustomer#{index}"
        fieldName: "customers.#{index}.name"
        value: item

Template.CustomerItem.events
  'click [data-action="remove-customer"]': (e) ->
    e.preventDefault()
    Companies.update(
        { _id: Companies.findOne()._id },
        { $pull: 
            { customers: 
                {name: Template.currentData().value.name } }
        }
    )


Template.AddCustomer.events
  'click .add-customer': (e) ->
    e.preventDefault()
    $('.customer-popover').toggle()
  'click .add-customer-btn': (e) ->
    customer = document.getElementById("customer-input")
    Companies.update(
        { _id: Companies.findOne()._id },
        { $push: 
            { customers: 
                {name: customer.value } }
        }
    )
    customer.value=''
    $('.customer-popover').hide()
