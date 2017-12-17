# Programa Chef Peru quiere procesar datos de concursantes y resultados
# Participante tiene DNI,nombre,edad,puntaje_jurado,puntaje_publico
# Puntaje final = puntaje jurado*0.7 + puntajepublico*0.3
# Hay chefs que son amateurs, profesionales y masters

class Participante
    attr_accessor :dni,:nombre,:edad,:puntaje_jurado,:puntaje_publico
    def initialize (dni,nombre,edad,puntaje_jurado,puntaje_publico)
        @dni,@nombre,@edad,@puntaje_jurado,@puntaje_publico = dni,nombre,edad,puntaje_jurado,puntaje_publico
    end
    
    def puntaje_final
        
    end
end

class Amateur < Participante
    def initialize(dni,nombre,edad,puntaje_jurado,puntaje_publico)
        super(dni,nombre,edad,puntaje_jurado,puntaje_publico)
    end
    def puntaje_final
        puntaje_jurado*0.7 + puntaje_publico*0.3
    end
end

class Profesional < Participante
    attr_accessor :anio_experiencia
    def initialize(dni,nombre,edad,puntaje_jurado,puntaje_publico,anio_experiencia)
        super(dni,nombre,edad,puntaje_jurado,puntaje_publico)
        @anio_experiencia=anio_experiencia
    end
    def puntaje_final
        puntaje_jurado*0.7 + puntaje_publico*0.3
    end
end

class Master < Participante
    def initialize(dni,nombre,edad,puntaje_jurado,puntaje_publico)
        super(dni,nombre,edad,puntaje_jurado,puntaje_publico)
    end
    
    def puntaje_final
        puntaje_jurado
    end
end

class Administrador
end