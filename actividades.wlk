class Actividad {
  const idiomas = #{}
  method idiomas() {
    return idiomas
  }

  method sirveParaBroncearse() {
    
  }

  method esInteresante() = idiomas.size() > 1
 
  method dias()

  method implicaEsfuerzo()
}


class ViajeDePlaya inherits Actividad{
  const largo 

  override method dias() = largo / 500

  override method implicaEsfuerzo() = largo > 1200

  override method sirveParaBroncearse() = true


}

class ExcursionACuidad inherits Actividad {

const property cantidadAtracciones = 1



override method dias() = cantidadAtracciones / 2

override method implicaEsfuerzo() = cantidadAtracciones.between(5, 8)

override method sirveParaBroncearse() = false

override method esInteresante() = super() || cantidadAtracciones == 5

}

class ExcursionTropical inherits ExcursionACuidad {
  
override method dias() = super() + 1

override method sirveParaBroncearse() = true

}


class Trekking inherits Actividad {
  
const kms
const diasDeSol

override method dias() = kms / 50

override method esInteresante() = super() || diasDeSol > 140

override method implicaEsfuerzo() = kms > 80

override method sirveParaBroncearse(){
  return
  diasDeSol > 200 || 
  (diasDeSol.between(100, 200) && kms > 120)
}

}

class ClasesDeGimnasia inherits Actividad {

method initialize(){
  idiomas.clear()
  idiomas.add("español")
  }

  method validador(){
    if(idiomas ==#{"español"}) {
      self.error("el unico idioma disponible es español")
    }
  }

  override method dias() = 1 
  override method sirveParaBroncearse() = false

}


class Socios {
  const actividadesRealizadas = []
  var cantMaxAct = 0
  const idiomasQueHabla = []
  var edad = 0
  var property tipoDeSocio = socioTranquilo

  method esAdoradorDelSol() = actividadesRealizadas.all({a => a.sirveParaBroncearse()})
  method coleccionActEsforzadas() = actividadesRealizadas.filter({a => a.implicaEsfuerzo()})
  method registrarAct(unaActividad) {
    if(actividadesRealizadas.size() < cantMaxAct) {
      actividadesRealizadas.add(unaActividad)
    }
    else {
      self.error("Se alcanzó el maximo de actividades para este socio")
    }
  } 
  method leAtrae(unaActividad) = tipoDeSocio.leGusta(unaActividad)
  method idiomasQueHabla() = idiomasQueHabla
  method esRecomendada(unaActividad) = unaActividad.seRecomiendaA(self)
  method edad() = edad
}


object socioTranquilo inherits Socios {
  override method leAtrae(unaActividad) = unaActividad.dias() >= 4
} 


object socioCoherente inherits Socios {
   override method leAtrae(unaActividad) = if(self.esAdoradorDelSol()) {unaActividad.sirveParaBroncearse()}
    else{
      unaActividad.implicaEsfuerzo()
    }
}       


object socioRelajado inherits Socio {
   override method leAtrae(unaActividad){
    return
     not idiomasQueHabla.intersection(unaActividad.idioma()).isEmpty()
   }
}
