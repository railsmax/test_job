class SettingsController < ApplicationController
  cache_sweeper :setting_sweeper, :only=>[:create,:update,:destroy]
  caches_action :index,:cache_path => Proc.new { |controller| controller.params }
  caches_action :show
  
  layout "application"
  
  make_resourceful do
    build :all    
  end
 
  def accordion
      
  end 
  
end
