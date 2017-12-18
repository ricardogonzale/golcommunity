# encoding: utf-8

module ModeloMetodosGenerales
    # -------  METODO EJECUTADO AUTOMATICAMENTE AL INCLUIRSE EL MODELO  ----------
    def self.included(base)
        base.class_eval do
        
            # Es llamado antes de la validacion   ********************
            before_validation(:on => :create) do
                # *********** RELACIONADOS AL ESTATUS DEL REGISTRO *************
                self.estatus = 'A' if  self.estatus.nil?
        
                # *********** RELACIONADOS A LA AUDITORIA DEL REGISTRO ****  
                if $sesion_usuario_id == 0
                    self.usuario_creacion_id = 1
                else
                    self.usuario_creacion_id = $sesion_usuario_id
                end 
        
                self.fecha_creacion  = Time.now
            end
      
          
          
            # Es llamado antes de la validacion  ******************   
            before_validation(:on => :update) do 
          
                # *********** RELACIONADOS A LA AUDITORIA DEL REGISTRO ****
                if $sesion_usuario_id == 0
                    self.usuario_actualizacion_id = 1
                else
                    self.usuario_actualizacion_id = $sesion_usuario_id
                end 
              
                self.fecha_actualizacion  = Time.now
            end
        end
    end


    # ------------------------------------------------------------------------------
    def estado 
        case self[:estatus]
        when 'A' then 
            'ACTIVO'
        when 'N' then 
            'NO PUBLICADO'
        when 'B' then 
            'BORRADO'
        end
    end  


end
