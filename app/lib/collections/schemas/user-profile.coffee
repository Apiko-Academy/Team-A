schema = new SimpleSchema
  fullname:
    type: String
    label: 'Full name'
    min: 2
    max: 140
  photo:
    type: Mongo.ObjectID
    label: 'Photo'
    optional: true
  companies:
  	type: [Mongo.ObjectId]
  	label: 'Companies'
  	defaultValue: []


Namespace 'schemas', UserProfile:schema
