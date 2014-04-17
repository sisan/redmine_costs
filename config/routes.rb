# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html


RedmineApp::Application.routes.draw do 

  match 'projects/:id/redmine_costs', :to => 'costs#index'
  
end
