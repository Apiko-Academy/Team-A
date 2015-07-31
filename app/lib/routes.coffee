Router.configure
  layoutTemplate: 'SimpleLayout'
  loadingTemplate: 'Loading'
  notFoundTemplate: 'NotFound'

AccountsTemplates.configureRoute 'signIn',
  layoutTemplate: 'Layout'
  redirect: () ->
    user = Meteor.user()
    unless user
      return
    if user.profile.companies.length
      Router.go 'userProfile'
    else
      Router.go 'createCompany'

AccountsTemplates.configureRoute 'signUp',
  layoutTemplate: 'Layout'
  redirect: () ->
    Router.go 'createCompany'

Router.route '/',
  name: 'home'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'Home'
    @render 'HomeMenu', to: 'layoutMenu'

AccountsTemplates.configureRoute 'resetPwd',
  layoutTemplate: 'Layout'

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

Router.route '/user/profile',
  name: 'userProfile'
  waitOn: () ->
    Meteor.subscribe 'fullUserProfile'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'UserProfile'
    @render 'DefaultMenu', to: 'layoutMenu'

Router.goToAccessForbidden = () ->
  url = Iron.Location.get().path
  Winston.warn "Request to forbidden url \"#{url}\""
  Router.go 'accessForbidden'

Router.route '/company/create',
  name: 'createCompany'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'CreateCompany'
    @render 'DefaultMenu', to: 'layoutMenu'

Router.onStop () ->
  url = Iron.Location.get().path
  Session.set 'previousUrl', url

Router.onBeforeAction () ->
  if Meteor.userId()
    @next()
  else
    Router.go 'accessForbidden'
,
  only: ['createCompany', 'userProfile']
