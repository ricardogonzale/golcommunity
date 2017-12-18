class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
    before_action :inicializar
    
    def inicializar
        session[:usuario_id]      = 4
        session[:nombre_completo] = "Jose Belman"
        session[:usuario]         = "Jose Belman"

        session[:rol_id]          = 4
        session[:rol]             = "Usuario"
        session[:rol_nivel]       = 3
       
    end 
    
end
