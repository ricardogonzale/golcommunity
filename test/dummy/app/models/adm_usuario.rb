# encoding: utf-8

class AdmUsuario < ActiveRecord::Base
  
    include ModeloMetodosGenerales
  
    has_secure_password
  
    # --------------  RELACIONES CON OTRAS TABLAS ---------------------------------------------   
    belongs_to :adm_rol, :foreign_key => :adm_rol_id # modelo - en singular 
#    has_one :persona
    
  
    # --------------  TITULOS DE LOS FORMULARIOS ---------------------------------------------   
    TITULOS = {
        :index => "Listado de Usuarios existentes",
        :show =>  "Consulta de Usuario existente",
        :new =>   "Ingresar Usuario nuevo",
        :edit =>  "Editar Usuario existente"
    } 
  
    # --------------  CAMPOS A MOSTRAR EN LOS FORMULARIOS INDEX Y SHOW -----------------------
    # Especifique lo atributos que desee aparezcan en las vistas.
    # El orden es importante. Por ej., en la vista index, se mostrará de 1ro el campo ID, seguido de DESCRIPCION, etc.
    VISTAS = [
        { :nombre =>                    [ :index, :show ] },
        { :rol =>                       [ :index, :show ] },
        { :estado =>                    [ :index, :show ] },
        { :creado =>                    [ :show ] },
        { :actualizado =>               [ :show ] },
    ] 
  
    # --------------  CAMPOS A SER MODIFICADOS POR EL USUARIO ------------------------------
    PARAMETROS = :nombre, :nombre_confirmation, :password, :password_confirmation, :adm_rol_id, :token_activacion, :estatus;
  
    # --------------- VALIDACIONES DE LOS CAMPOS --------------------------------------------
    validates :nombre, :nombre_confirmation,
        :presence =>    { message: " es requerido"},
        :length =>      { within: 4..99 },
        :format =>      { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                          message: "* Lo que ha escrito no es un correo"  } 
    
    validates :nombre, 
        :uniqueness =>  { case_sensitive: false ,
                          message: "ya esta registrado"},
        :confirmation => true
  
    validates :password,
        :presence =>   true,
        :length =>     { within: 4..50 }
       
  
    validates :estatus,
        :inclusion =>  { in: ['A', 'N', 'B'] 
    }
  
  
    #---------------------------------------------------------------------------------                   
    # --------------- METODOS DE LA CLASE --------------------------------------------

    #---------------------------------------------------------------------------------  
    def nombre_y_apellido 
        primer_nombre + ' ' + primer_apellido
    end
  
    #---------------------------------------------------------------------------------  
    def nombre_completo 
        primer_nombre + (' ' + segundo_nombre + ' ').squeeze(" ") + (primer_apellido + ' ' + segundo_apellido).strip
    end
  
    #---------------------------------------------------------------------------------  
    def self.buscar_por(id_usuario) 
        select("*, 
                    (SELECT p.primer_nombre || ' ' || p.primer_apellido || ' (' || u.nombre || ')' FROM adm_usuarios AS u LEFT JOIN personas AS p ON u.id = p.adm_usuario_id WHERE u.id = adm_usuarios.usuario_creacion_id) || ' - ' || to_char(fecha_creacion, 'DD/MM/YYYY HH:MI AM') AS creado, 
                    (SELECT p.primer_nombre || ' ' || p.primer_apellido || ' (' || u.nombre || ')' FROM adm_usuarios AS u LEFT JOIN personas AS p ON u.id = p.adm_usuario_id WHERE u.id = adm_usuarios.usuario_actualizacion_id) || ' - ' || to_char(fecha_actualizacion, 'DD/MM/YYYY HH:MI AM') AS actualizado,
                    (SELECT nombre FROM adm_roles WHERE estatus = 'A' AND id = adm_usuarios.adm_rol_id) AS rol")
        .where("estatus <> 'B' AND id = #{id_usuario}")
          
    end
  
    #---------------------------------------------------------------------------------
    def self.buscar_usuario_clave(usuario, clave) 
        select("id, nombre").
            where("estatus='A' AND clave = '#{clave}' AND nombre = '#{usuario}'")
    end
   
    #--------------------------------------------------------------------------------- 
    def self.buscar_todos_por_nivel(nivel, usuario_id) 
        if nivel < 3
            find_by_sql("SELECT id, nombre, estatus, adm_rol_id,
                             (SELECT nombre FROM adm_roles WHERE estatus = 'A' AND id = adm_usuarios.adm_rol_id) AS rol
                      FROM adm_usuarios
                        WHERE estatus <> 'B'")
          
        else
            find_by_sql("SELECT id, nombre, estatus, adm_rol_id, 
                             (SELECT nombre FROM adm_roles WHERE estatus = 'A' AND id = adm_usuarios.adm_rol_id) AS rol
                      FROM adm_usuarios
                      WHERE (estatus <> 'B' AND id = #{usuario_id}) 
                         OR (estatus <> 'B' AND usuario_creacion_id = #{usuario_id})") 
        end
      
    end
  
  
    #---------------------------------------------------------------------------------
    def self.buscar_por_usuario(usuario) 
        select("id, nombre").
            where("estatus = 'A' AND nombre = '#{usuario}'").
            first
    end
     
     
    #--------------------------------------------------------------------------------- 
    def self.buscar_por_rol(rol)
        select("personas.id, personas.primer_nombre || ' ' || personas.primer_apellido || ' ' || personas.segundo_apellido AS nombre")
        .joins([:persona, :adm_rol])
        .where("adm_roles.nombre = '#{rol}' AND personas.estatus = 'A'")
    end 
  
end
