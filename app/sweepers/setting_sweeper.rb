class SettingSweeper < ActionController::Caching::Sweeper
  observe Setting
  
  def after_create(setting)
    expire_action :controller => 'settings', :action=>'index'
  end
  
  def after_save(setting)
    expiration_index_and_show(setting)
  end
  
  def after_update(setting)
    expiration_index_and_show(setting)
  end
  
  def after_destroy(setting)
    expiration_index_and_show(setting)  
  end
  
  def expiration_index_and_show(setting)
    expire_action :controller => 'settings', :action=>"index"      
    expire_action :controller => 'settings', :action=>'show', :id=>setting.id        
  end
end
