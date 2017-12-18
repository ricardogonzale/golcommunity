EngineMensajes::Engine.routes.draw do
    root :to => "inicio_motor#home_motor"
    
    get '/detalle/:id',     :to => 'inicio_motor#detalle'
end
