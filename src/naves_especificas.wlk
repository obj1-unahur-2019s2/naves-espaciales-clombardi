import nave_basica.*

class NaveBaliza inherits Nave {
	var property colorBaliza = "verde"
	
	method cambiarColorDeBaliza(nuevoColor) {
		colorBaliza = nuevoColor
	}
	
	override method prepararViaje() {
		self.cambiarColorDeBaliza("verde")
		self.ponerseParaleloAlSol()
		super()
	}
	
	// al agregar las definiciones de los métodos avisar()  y escapar()
	// completo la definición de la superclase abstracta Nave
	override method avisar() {
		self.cambiarColorDeBaliza("rojo")
	}

	override method escapar() {
		self.irHaciaElSol()
	}
}

class NaveDePasajeros inherits Nave {
	var property cantPasajeros = 0
	var property cantRacionesComida = 0
	var property cantRacionesBebida = 0
	
	method cargarComida(cuanto) {
		cantRacionesComida = cantRacionesComida + cuanto 
	}
	method descargarComida(cuanto) {
		cantRacionesComida = cantRacionesComida - cuanto 
	}
	method cargarBebida(cuanto) {
		cantRacionesBebida= cantRacionesBebida + cuanto 
	}
	method descargarBebida(cuanto) {
		cantRacionesBebida = cantRacionesBebida - cuanto 
	}

	override method prepararViaje() {
		self.cargarComida(4 * cantPasajeros)
		self.cargarBebida(6 * cantPasajeros)
		self.acercarseUnPocoAlSol()
		super()
	}

	// si sale la de arriba, mejor
	// si no, esta también vale
	method prepararViaje_masLargo() {
		const comidaACargar = 4 * cantPasajeros
		const bebidaACargar = 6 * cantPasajeros  
		self.cargarComida(comidaACargar)
		self.cargarBebida(bebidaACargar)
		self.acercarseUnPocoAlSol()
	}

	override method avisar() {
		self.descargarComida(cantPasajeros)
		self.descargarBebida(2 * cantPasajeros)
	}

	override method escapar() {
		self.acelerar(self.velocidad())
	}
}


class NaveDeCombate inherits Nave {
	var visible = true
	var property misilesDesplegados = true
	var mensajes = []
	
	method ponerseVisible() { visible = true }
	method ponerseInvisible() { visible = false }
	method estaInvisible() { return not visible }
	method desplegarMisiles() { misilesDesplegados = true }
	method replegarMisiles() { misilesDesplegados = false }
	
	method emitirMensaje(texto) { mensajes.add(texto) }
	method mensajesEmitidos() { return mensajes }
	method primerMensajeEmitido() { return mensajes.first() }
	method ultimoMensajeEmitido() { return mensajes.last() }
	
	method esEscueta() {
		return not mensajes.any({ msg => msg.size() > 30 })	// bien
//		return mensajes.any({ msg => not msg.size() > 30 })  // mal
//		return mensajes.all({ msg => msg.size() <= 30 })  // bien
//		return mensajes.all({ msg => msg.size() > 30 })  // mal
		// si cambio el any por el all, tengo que cambiar "la boquita"
	}
	
	method emitioMensaje(msgX) {
		return mensajes.contains(msgX)			// bien
//		return mensajes.any({ msg => msg == msgX })  	// menos bien
		// si la condición del any es un "=="
		// pienso si no calza un contains 
	}

	// se ponen visibles, repliegan sus misiles, 
	// aceleran 15000 kms/seg, y emiten el mensaje "Saliendo en misión"	
	override method prepararViaje() {
		self.ponerseVisible()
		self.replegarMisiles()
		self.acelerar(15000)
		self.emitirMensaje("Saliendo en misión")
		super()
	}

	override method avisar() {
		self.emitirMensaje("Amenaza recibida")
	}

	override method escapar() {
		self.acercarseUnPocoAlSol()
		self.acercarseUnPocoAlSol()
	}
}


















