class Permissions < Aegis::Permissions

  role :admin, :default_permission => :allow
  role :mainuser
  role :subuser_projects # subuser that can create projects
  role :subuser
  # role :subuser_projects_view # subuser that can create projects
  # role :subuser_projects_edit # subuser that can create projects
  # role :subuser_view
  # role :subuser_edit

  # resources :users do
  #     action :new, :create, :edit, :show,:destroy, :update do
  #       allow :mainuser
  #       deny :subuser_projects
  #       deny :subuser
  #     end
  # end

  # action :update_project do |project|
  #   user.projects.include? project
  # end
  
  # project = Project.find(3)
  # current_user.may_update_project?(project)




  # para user controller
  # action :new, :create, :edit, :update do
  #   allow :mainuser
  #   deny :subuser_projects
  #   deny :subuser
  # end
  
# PARECE QUE VAN LOS 7 EN USERS


  # resources :users, :only => [:index, :show, :destroy]
  
  # resources :users, :only => [:index, :show, :destroy] do
  resources :users do
  # usar resource, pero separlos por metodos
    action :index, :new, :edit, :destroy do
    # action :index, :show, :destroy do
      # allow :everyone
      allow :mainuser
      deny :subuser_projects
      deny :subuser
    end
    
    action :show do
      deny :mainuser, :subuser_projects, :subuser
    end
    
    action :assign_project, :unassign_project, :change_rights do
      allow :mainuser
      deny :subuser_projects, :subuser
    end
    
  end

  resources :projects do

    action :index, :edit do
      allow :everyone
    end
    
    action :new, :create, :update, :destroy do
      allow :mainuser, :subuser_projects
      deny :subuser
    end
    
    action :show do
      allow :mainuser, :subuser_projects, :subuser
    end
    
  end

end
