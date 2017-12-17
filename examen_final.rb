# Programa Chef Peru quiere procesar datos de concursantes y resultados
# Participante tiene DNI,nombre,edad,puntaje_jurado,puntaje_publico
# Puntaje final = puntaje jurado*0.7 + puntajepublico*0.3
# Hay chefs que son amateurs, profesionales y masters

class Participante
    attr_accessor :dni,:nombre,:edad,:puntaje_jurado,:puntaje_publico
    def initialize (dni,nombre,edad,puntaje_jurado,puntaje_publico)
        @dni,@nombre,@edad,@puntaje_jurado,@puntaje_publico = dni,nombre,edad,puntaje_jurado,puntaje_publico
    end
    
    def calcular_puntaje_final
    end
    
    def dame_tipo_envio
	end
end

class Amateur < Participante
    def initialize(dni,nombre,edad,puntaje_jurado,puntaje_publico)
        super(dni,nombre,edad,puntaje_jurado,puntaje_publico)
    end
    def calcular_puntaje_final
        puntaje_jurado*0.7 + puntaje_publico*0.3
    end
    def dame_tipo_envio
        "Amateur"
	end
end

class Profesional < Participante
    attr_accessor :anio_experiencia
    def initialize(dni,nombre,edad,puntaje_jurado,puntaje_publico,anio_experiencia)
        super(dni,nombre,edad,puntaje_jurado,puntaje_publico)
        @anio_experiencia=anio_experiencia
    end
    def calcular_puntaje_final
        if(anio_experiencia>10)
            puntaje_jurado*0.7 + puntaje_publico*0.3 + 2
        else
            puntaje_jurado*0.7 + puntaje_publico*0.3
        end
    end
    def dame_tipo_envio
        "Profesional"
	end
end

class Master < Participante
    def initialize(dni,nombre,edad,puntaje_jurado,puntaje_publico)
        super(dni,nombre,edad,puntaje_jurado,puntaje_publico)
    end
    
    def calcular_puntaje_final
        puntaje_jurado
    end
    
    def dame_tipo_envio
        "Master"
	end
end

class Factory 
    def self.crear_participante(categoria, *arg)
        case categoria
        when "Amateur"
            Amateur.new(arg[0],arg[1],arg[2],arg[3],arg[4])
        when "Profesional"
            Profesional.new(arg[0],arg[1],arg[2],arg[3],arg[4],arg[5])
        when "Master"
            Master.new(arg[0],arg[1],arg[2],arg[3],arg[4])
        end
    end
end

class Concurso
    attr_accessor :arreglo_participantes
	def initialize
		@arreglo_participantes = Array.new # []
	end
	def registrar(categoria,*arg)
	    envio = Factory.crear_participante(categoria,*arg)
		arreglo_participantes.push(envio)
	end
	def obtener_lista_todos
	    puts "***Listado de envios***"
        for p in arreglo_participantes
            puts "#{p.dni} #{p.nombre} #{p.edad} #{p.puntaje_jurado} #{p.puntaje_publico} #{p.calcular_puntaje_final}"
        end
	end
	def ganador_concurso
	    maximo_puntaje = 0
	    ganador = []
	    for p in arreglo_participantes
	        if  p.calcular_puntaje_final > maximo_puntaje
	            maximo_puntaje = p.calcular_puntaje_final
	            ganador = p
	        end
	    end
	    puts "Ganador :"
	    puts "#{ganador.dni} #{ganador.nombre} #{ganador.edad} #{ganador.puntaje_jurado} #{ganador.puntaje_publico} #{ganador.calcular_puntaje_final}"
	end
end

concurso = Concurso.new
concurso.registrar("Amateur","87665431","GBS","26",70,90)
concurso.registrar("Profesional","87665331","GAS","27",60,80,11)
concurso.registrar("Amateur","87665131","GDS","28",50,90)
concurso.registrar("Master","87665031","GFS","29",40,80)
concurso.registrar("Profesional","87665831","GGS","22",30,90,9)
concurso.obtener_lista_todos
concurso.ganador_concurso