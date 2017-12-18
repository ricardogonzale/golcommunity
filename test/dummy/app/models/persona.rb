# encoding: utf-8

class Persona < ActiveRecord::Base
 
    include ModeloMetodosGenerales
  
    # --------------  RELACIONES CON OTRAS TABLAS --------------------------------------------- 
    belongs_to :adm_usuario,    :foreign_key => :usuario_id
     
    # --------------- VALIDACIONES DE LOS CAMPOS --------------------------------------------
    validates :primer_nombre, :primer_apellido,
        :presence =>   true,
        :length =>     { :within => 1..50 }
    
    validates :segundo_nombre, :segundo_apellido,
        :length =>     { :maximum => 50 }
    
    validates :adm_usuario_id, :fecha_nacimiento, :territorio_nivel1_id, :territorio_nivel2_id, :territorio_nivel3_id, :nacionalidad_id, :nivel_estudios_id,
        :presence =>   true
                      
    validates :estatus,
        :inclusion =>  { :in => ['A', 'N', 'B'] 
    }
                   
    #---------------------------------------------------------------------------------                   
    # --------------- METODOS DE LA CLASE --------------------------------------------

     
     

end
