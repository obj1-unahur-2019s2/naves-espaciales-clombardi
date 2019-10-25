class Nave {
	var property velocidad = 0
	var property direccionRespectoDelSol = 0	
	var property combustible = 0
	
	method acelerar(cuanto) {
		velocidad = 100000.min(velocidad + cuanto)	// bien
//		velocidad = (velocidad + cuanto).min(100000)	// bien
	}
	method desacelerar(cuanto) {
		velocidad = 0.max(velocidad - cuanto)
	}
	method irHaciaElSol() {
		direccionRespectoDelSol = 10
	}
	method escaparDelSol() {
		direccionRespectoDelSol = -10
	}
	method ponerseParaleloAlSol() {
		direccionRespectoDelSol = 0
	}
	method acercarseUnPocoAlSol() {
		direccionRespectoDelSol = 10.min(direccionRespectoDelSol + 1)
	}
	method alejarseUnPocoDelSol() {
		direccionRespectoDelSol = (-10).max(direccionRespectoDelSol - 1)
	}

	method cargarCombustible(cuanto) {
		combustible = combustible + cuanto 
	}
	method descargarCombustible(cuanto) {
		combustible = combustible - cuanto 
	}
	
	method prepararViaje() {
		self.cargarCombustible(30000)
		self.acelerar(5000)
	}
	
	method recibirAmenaza() {
		self.escapar()
		self.avisar()
	}

	// método abstracto
	method escapar() 		

	// método abstracto
	method avisar() 		
}




