Router.configure
  layoutTemplate: 'SimpleLayout'
  loadingTemplate: 'Loading'
  notFoundTemplate: 'NotFound'

AccountsTemplates.configureRoute 'signIn',
  layoutTemplate: 'Layout'
AccountsTemplates.configureRoute 'signUp',
  layoutTemplate: 'Layout'

Router.route '/',
  name: 'home'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'Home'
    @render 'HomeMenu', to: 'layoutMenu'

Router.route '/access-forbidden',
  name: 'accessForbidden'

Router._scrollToHash = (hash) ->
  hash = 'body' unless hash.length
  $section = $ hash
  if $section.length
    $('html, body').animate
      scrollTop: $section.offset().top
    ,
      'slow'

Router.route '/company/create',
  name: 'createCompany'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'CreateCompany'
    @render 'CreateCompanyMenu', to: 'layoutMenu'

Router.onBeforeAction () ->
  if Meteor.userId()
    @next()
  else
    Router.go 'accessForbidden' 
,
  only: ['createCompany']