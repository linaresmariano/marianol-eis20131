require 'sinatra/base'
require '../code_breaker/code_breaker.rb'

class MyApplication < Sinatra::Base

  enable :sessions
  
  get '/' do
    redirect '/palabra'
  end

  get '/palabra' do
    
    palabra = params[:p]
    
    if palabra
      begin
        session[:game] = CodeBreaker.new(palabra, 3)
        session[:game].build_string_showing_correct_letters
        redirect '/adivinar'
      rescue WordError
        redirect '/palabra'
      end
    end

    erb :palabra
  end
  
  get '/adivinar' do
    letra = params[:l]
    
    if letra
      begin
        @msg = (session['game'].guess letra) ? 'acierto' : 'ups!'
      rescue WinnerException
        @result = 'Juego terminado, ganaste'
      rescue LoserException
        @msg = 'ups!'
        @result = 'Juego terminado, perdiste'
      end
    end
    
    @lifes = session['game'].life
    @state = session['game'].build_string_showing_correct_letters
      
    erb :adivinar
  end
end
