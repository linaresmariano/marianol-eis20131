
require 'test/unit'

class PalindromoTest < Test::Unit::TestCase
  def test_true_frase_palindromo
    assert es_palindromo('anita lava la tina')
  end

  def test_true_palabra_palindromo
  	assert es_palindromo('neuquen')
  end

  def test_true_palabra_palindromo_con_numeros
  	assert es_palindromo('n1e2u3q4u5e6n')
  end  

  def test_false_frase_cualquiera
  	assert !(es_palindromo('hola no soy palindromo'))
  end

  def test_false_palabra_cualquiera
  	assert !(es_palindromo('hola'))
  end

  def test_false_palabra_con_numeros
  	assert !(es_palindromo('hol421a;'))
  end
end

# Retorna true si las letras del texto a analizar son un palindromo
# No toma en cuenta numeros, ni espacios, ni caracteres especiales
def es_palindromo(texto_a_analizar)
	# Texto a analizar, sin espacios, ni numeros
	texto = solo_letras(texto_a_analizar)
	# Redondeo para arriba por si la cantidad de letras es impar
	cantidad = (texto.length / 2).ceil

	for i in 0..cantidad

		if (! (texto[i] == texto[(i+1) * -1]))
			return false
		end
	end

	return true
end

# Denota un nuevo string solo con las letras del text_a_analizar
def solo_letras(texto_a_analizar)
	# Expresion regular para saber si es letra
	reg_exp = /[a-zA-Z]+/
	resultado = ""

	# Recorro el texto y me quedo solo con letras
	for i in 0...texto_a_analizar.length
		caracter = texto_a_analizar[i]

		if caracter.match(reg_exp)
			resultado += caracter
		end
	end

	return resultado
end