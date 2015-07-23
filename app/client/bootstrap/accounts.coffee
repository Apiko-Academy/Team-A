AccountsTemplates.addField
  _id: 'username'
  type: 'text'
  required: true
  min: 3
  max: 32
  re: /^[\w]{3,32}$/

AccountsTemplates.addField
  _id: 'fullname'
  type: 'text'
  display: 'Fullname'
  required: true
  trim: true
