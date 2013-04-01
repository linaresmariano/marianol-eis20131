
require 'test/unit'

class FibonacciTest < Test::Unit::TestCase
	def test_true_con_0
		assert es_de_fibonacci(0)
	end

	def test_true_con_1
		assert es_de_fibonacci(1)
	end

	def test_true_con_2
		assert es_de_fibonacci(2)
	end

	def test_true_con_8
		assert es_de_fibonacci(8)
	end

	def test_true_con_13
		assert es_de_fibonacci(13)
	end

	def test_true_con_21
		assert es_de_fibonacci(21)
	end

	def test_true_con_89
		assert es_de_fibonacci(89)
	end

	def test_false_con_10
		assert !es_de_fibonacci(10)
	end

	def test_false_con_20
		assert !es_de_fibonacci(20)
	end

	def test_false_con_45
		assert !es_de_fibonacci(45)
	end

	def test_false_con_52
		assert !es_de_fibonacci(52)
	end

	def test_false_con_73
		assert !es_de_fibonacci(73)
	end
end

# INFO sobre fibonacci sacada de http://gaussianos.com/algunas-curiosidades-sobre-los-numeros-de-fibonacci/

# Retorna true si el numero pertenece a la secuencia de fibonacci
def es_de_fibonacci(numero)
	return es_int_positivo(numero) && 
	(es_cuadrado_perfecto(5* (numero**2) + 4) ||
	es_cuadrado_perfecto(5* (numero**2) - 4))
end

# Retorna true si el numero es entero
def es_int(numero)
	return (numero - numero.floor) == 0
end

# Retorna true si el numero es entero y positivo, incluyendo el cero
def es_int_positivo(numero)
	return (numero >= 0) && es_int(numero)
end

def es_cuadrado_perfecto(numero)
	return es_int(Math.sqrt(numero))
end