Tmfs::Application.routes.draw do
  resources :settings do 
    collection do
      get 'accordion'
    end
  end
  root :to => "settings#index"  
  

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id(.:format)))'
end
