import naves_especificas.*

class NaveHospital inherits NaveDePasajeros {
	var property quirofanosPreparados = true
	
	override method recibirAmenaza() {
		super()
		self.quirofanosPreparados(true)
	}
}

class NaveDeCombateSigilosa inherits NaveDeCombate {
	override method escapar() {
		super()
		self.desplegarMisiles()
		self.ponerseInvisible()
	}
}