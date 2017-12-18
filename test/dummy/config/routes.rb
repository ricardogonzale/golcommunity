Rails.application.routes.draw do
  mount EngineMensajes::Engine => "/mensajes"
  
  root :to => "inicio#home"
  
end
