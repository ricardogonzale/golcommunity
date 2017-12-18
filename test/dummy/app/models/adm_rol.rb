# encoding: utf-8

class AdmRol < ActiveRecord::Base
  
     include ModeloMetodosGenerales
     
     # --------------  RELACIONES CON OTRAS TABLAS ---------------------------------------------   
     has_many :adm_usuarios # tabla - en plural
  
     # --------------  TITULOS DE LOS FORMULARIOS ---------------------------------------------   
     TITULOS = {
          :index => "Listado de Roles de Usuarios existentes",
          :show =>  "Consulta de Roles Usuario existente",
          :new =>   "Ingresar Rol nuevo",
          :edit =>  "Editar Rol existente"
     } 
  
     # --------------  CAMPOS A MOSTRAR EN LOS FORMULARIOS INDEX Y SHOW -----------------------
     # Especifique lo atributos que desee aparezcan en las vistas.
     # El orden es importante. Por ej., en la vista index, se mostrarÃ¡ de 1ro el campo ID, seguido de DESCRIPCION, etc.
     VISTAS = [
          { :nombre =>                    [ :index, :show ] },
          { :descripcion =>               [ :index, :show ] },
          { :nivel =>                     [ :index, :show ] },
          { :estado =>                    [ :index, :show ] },
          { :creado =>                    [ :show ] },
          { :actualizado =>               [ :show ] },
     ] 
  
     # --------------  CAMPOS A SER MODIFICADOS POR EL USUARIO ------------------------------
     PARAMETROS = :nombre, :descripcion, :nivel, :estatus;
  
     # --------------- VALIDACIONES DE LOS CAMPOS --------------------------------------------
     validates :nombre,
          :presence =>   true,
          :length =>     { :within => 3..99 },
          :uniqueness => true,
          :format =>     { :with => /\A[A-Za-z0-9ÑñÁÉÍÓÚÜáéíóú][A-Za-z0-9.ÑñÁÉÍÓÚÜáéíóú ]+\z/, 
          :message => "* Se permiten SOLO letras y numeros" 
     }
  
     validates :descripcion,
          :presence =>   true,
          :length =>     { :within => 4..254 },
          :uniqueness => true,
          :format =>     { :with => /\A[A-Za-z0-9ÑñÁÉÍÓÚÜáéíóú][A-Za-z0-9.ÑñÁÉÍÓÚÜáéíóú ]+\z/,
          :message => "* Se permiten SOLO letras y numeros" 
     }           
  
     validates :nivel,
          :presence =>   true

  
     validates :estatus,
          :inclusion =>  { :in => ['A', 'N', 'B'] 
     }
  
  
     #---------------------------------------------------------------------------------                   
     # --------------- METODOS DE LA CLASE --------------------------------------------
    
     #---------------- BUSQUEDA DE ROL A PARTIR DEL ID DEL USUARIO - INICIO DE SESION -----------------------------------------------------------------  
     def self.buscar_rol(usuario_id) 
          select("adm_roles.*")
          .joins(:adm_usuarios)
          .where("adm_usuarios.id = #{usuario_id} AND adm_roles.estatus = 'A'")
          .first
     end
   

  
end
