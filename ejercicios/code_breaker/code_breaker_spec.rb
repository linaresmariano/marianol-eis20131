require 'rspec'
require_relative './code_breaker'

describe CodeBreaker do

  describe 'guess(a_letter)' do

		describe "when the letter belongs to missing word" do

			describe "with only one occurrence of the letter" do
				before(:each) do
					@code_breaker = CodeBreaker.new("murcielago", 5)
					@initial_life = @code_breaker.life
					@resultado = @code_breaker.guess("m")
				end

				it "returns a string which includes the guessed letter in the correct place and asterisks in the spaces left" do
					@resultado.should eq "m*********"
				end

				it "shouldn't decrement life" do
					@code_breaker.life.should eq @initial_life
				end
			end

			describe "with more than one occurrence of the letter" do
				before(:each) do
					@code_breaker = CodeBreaker.new("otorrinolaringologia", 5)
					@initial_life = @code_breaker.life
					@resultado = @code_breaker.guess("o")
				end

				it "returns a string which includes the guessed letters in the correct place and asterisks in the spaces left" do
					@resultado.should eq "o*o****o******o*o***"
				end

				it "shouldn't decrement life" do
					@code_breaker.life.should eq @initial_life
				end
			end

			describe "having other letters guessed before, all the correct ones appear" do
				before(:each) do
					@code_breaker = CodeBreaker.new("murcielago", 5)
					@initial_life = @code_breaker.life
					@code_breaker.guess("u")
					@result = @code_breaker.guess("l")
				end

				it "returns a string which includes the guessed letters in the correct place and asterisks in the spaces left" do
					@result.should eq "*u****l***"
				end

				it "shouldn't decrement life" do
					@code_breaker.life.should eq @initial_life
				end
			end
		end

		describe "when letter not belongs to missing word" do

			describe "and you had a life left" do

				it "should throw LoserException" do
					code_breaker = CodeBreaker.new("murcielago", 1)
					begin
						resultado = code_breaker.guess("j")
						false.should eq true
					rescue LoserException
						true.should eq true
					end
				end
			end

			describe "and you had lifes" do

				before(:each) do
					@code_breaker = CodeBreaker.new("murcielago", 5)
					@initial_life = @code_breaker.life
					@resultado = @code_breaker.guess("j")
				end

				it "should return a string which isn't the letter you had put previously" do
					@resultado.should eq "**********"
				end

				it "should decrement life" do
					@code_breaker.life.should eq @initial_life-1
				end
			end
		end

		describe "when it's the last letter to guess and it's correct" do
			it "should throw WinnerException" do
				code_breaker = CodeBreaker.new("j", 5)
				begin
					code_breaker.guess("j")
					false.should eq true
				rescue WinnerException
					true.should eq true
				end
			end
		end
	end
end
