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

class Factory 
    def self.crear_participante(categoria, *arg)
        case categoria
        when "amateur"
            Amateur.new(arg[0],arg[1],arg[2],arg[3],arg[4])
        when "profesional"
            Profesional.new(arg[0],arg[1],arg[2],arg[3],arg[4],arg[5])
        when "master"
            Master.new(arg[0],arg[1],arg[2],arg[3],arg[4])
        end
    end
end

class Concurso
    attr_accessor :arreglo_participantes
	def initialize
		@arreglo_participantes = Array.new # []
	end
	def registrar(participante)
		arreglo_participantes.push(participante)
	end
	def obtener_lista_todos
	    puts "***Listado de envios***"
        for p in arreglo_participantes
            puts "#{p.dni} #{p.nombre} #{p.edad} #{p.puntaje_jurado} #{p.puntaje_publico} "
        end
	end
end

concurso = Concurso.new
p1 = Participante.new("87665431","GBS","26",70,90)
p2 = Participante.new("87665331","GAS","27",60,80)
p3 = Participante.new("87665131","GDS","28",50,90)
p4 = Participante.new("87665031","GFS","29",40,80)
p5 = Participante.new("87665831","GGS","22",30,90)
concurso.registrar(p1)
concurso.registrar(p2)
concurso.registrar(p3)
concurso.registrar(p4)
concurso.registrar(p5)
concurso.obtener_lista_todos
