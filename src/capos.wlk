object espada{
}

object collar {
	
}

object libro {
	
}
object armadura {
	
}

object castillo {
	
	const property artefactos = #{}
	
	
	method agregarArtefactos(_artefactos) {
		artefactos.addAll(_artefactos)		
	}
	
}

object rolando {

	const property artefactos = #{}
	var property capacidad = 2
	const casa = castillo
	const property historia = []
	

	method encontrar(artefacto) {
		if(artefactos.size() < capacidad) {
			artefactos.add(artefacto)
		}
		historia.add(artefacto)
	}
	
	method volverACasa() {
		casa.agregarArtefactos(artefactos)
		artefactos.clear()
	}	
	
	method poseciones() {
		return self.artefactos() + casa.artefactos()
	}
	
	method posee(artefacto) {
		return self.poseciones().contains(artefacto)	
	}

	
}