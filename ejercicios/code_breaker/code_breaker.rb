require 'set'

class CodeBreaker

  attr_reader :life

  def initialize(code)
    code = code.downcase
    raise WordError if (code.match /\W|\d/)

    @code = code
    @guessed_letters = Set.new
    @life = 5
  end

  def initialize(code, life)
    code = code.downcase
    raise WordError if (code.match /\W|\d/)

    @code = code
    @guessed_letters = Set.new
    @life = life
  end

  def guess(letter)
    letter = letter.downcase
    if( (letter.match /[a-zA-Z]/) && (@code.include? letter))
      @guessed_letters.add letter
    else
      decrement_and_check_life()
    end

    result = build_string_showing_correct_letters()

    raise WinnerException if(result == @code)
  
    return @code.include? letter

  end

  def decrement_and_check_life()
    @life = @life - 1

    if @life == 0
      raise LoserException
    end
  end

  def build_string_showing_correct_letters()

    result = String.new(@code)

    for i in 0...result.length

      if not @guessed_letters.include? result[i]
        result[i] = "*"
      end
    end

    return result
  end
end



#============================
#     Exceptions
#============================

class WinnerException < Exception
end

class LoserException < Exception
end

class WordError < Exception
end