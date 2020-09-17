import wollok.game.*


object mundo {
	const property alto = 10
	
	method ajustar(position) {
		var ajustada = position;
		if (ajustada.y() >= alto) {
			ajustada = game.at(ajustada.x(), alto - 1)
		}		
		return ajustada
	}
}

object espada{
	var property position = game.at(4,3);
	const property image = "espada.png"

}

object collar {
	var property position = game.at(7,9);
	const property image = "collar.png"
	
}

object libro {
	var property position = game.at(5,1);
	const property image = "libro.png"
	
}

object armadura {
	var property position = game.at(3,6);
	const property image = "armadura.png"
	
}

object castillo {

	var property position = game.at(0,0);
	const property image = "castillo.png"
	
	const property artefactos = #{}
	
	method altura() {
		return mundo.alto() 
	}
	
	method agregarArtefactos(_artefactos) {
		_artefactos.forEach {artefacto => 
			artefactos.add(artefacto)
			artefacto.position(game.at( artefactos.size(), self.altura()))
		}
		
		artefactos.addAll(_artefactos)
	}
	
}

object rolando {
	
	var property position = game.at(0,0);
	const property image = "caballero.png"

	const property artefactos = #{}
	var property capacidad = 2
	const casa = castillo
	const property historia = []
	
	 
	method alturaMochila() {
		return mundo.alto() + 1
	}

	method encontrar(artefacto) {
		if(artefactos.size() < capacidad) {
			artefactos.add(artefacto)
			artefacto.position( game.at(artefactos.size(), self.alturaMochila()) )
		}
		historia.add(artefacto)
	}
	
	method volverACasa() {
		self.position(casa.position())
		casa.agregarArtefactos(artefactos)
		artefactos.clear()
	}	
	
	method posesiones() {
		return self.artefactos() + casa.artefactos()
	}
	
	method posee(artefacto) {
		return self.posesiones().contains(artefacto)	
	}
	
	method position(_position) {
		position = mundo.ajustar(_position)
	}

	
}