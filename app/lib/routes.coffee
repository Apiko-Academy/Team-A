Router.configure
  layoutTemplate: 'SimpleLayout'
  loadingTemplate: 'Loading'
  notFoundTemplate: 'NotFound'

Router.route '/',
  name: 'home'
  layoutTemplate: 'Layout'
  action: () ->
  	@render 'Home'
  	@render 'HomeMenu', to: 'layoutMenu'
