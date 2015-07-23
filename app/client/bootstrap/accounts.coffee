AccountsTemplates.removeField 'password'
AccountsTemplates.addField
  _id: 'password'
  type: 'password'
  required: true
  minlenght: 6

AccountsTemplates.addField
  _id: 'username'
  type: 'text'
  required: true
  min: 3
  max: 32
  re: /^[\w]{3,32}$/
  errStr: 'invalid username'

AccountsTemplates.addField
  _id: 'fullname'
  type: 'text'
  min: 6
  max: 140
  display: 'Fullname'
  required: true
  trim: true
  re: /^[\w\s]{3,140}$/
  errStr: 'invalid fullname'
