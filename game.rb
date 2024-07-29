# frozen_string_literal: true

require_relative 'lib/player'
# Class Game - Mastermind Game will be played here
class Game < Player
  attr_accessor :player1, :player2, :main_colors, :hints, :computer_choice, :guess

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @main_colors = %w[purple yellow green blue orange red]
    @hints = []
    @computer_choice = []
    @guess = []
  end

  def code_making
    i = 0
    while i <= 3
      computer_choice.push(
        main_colors[(rand * 6).floor]
      )
      i += 1
    end

    p "Computer choose: #{computer_choice}"
  end

  def code_breaking
    i = 0
    while i <= 11
      guess = []
      puts "Please make a Guess- Choose 4 colors from #{main_colors}"
      j = 0
      while j <= 3
        guess.push(gets.chomp)
        j += 1
      end
      puts "Your Guess in round # #{i + 1}  is #{guess}"
      make_comparison(guess)

      i += 1

      break if result == true
    end
  end

  def make_comparison(guess)
    i = 0
    dummy_choice_red = computer_choice.dup
    dummy_guess_red = guess.dup

    # p dummy_choice
    # p guess

    # Check all reds and note the index where the red apeared
    while i <= 3

      if computer_choice[i] == guess[i]
        hints.push('red')
        dummy_choice_red[i] = nil
        dummy_guess_red[i] = nil
      end
      i += 1

    end

    # check for whites and while doing this don't include guesses at red_index for which we already included reds in hints
    dummy_choice_white = dummy_choice_red.compact
    dummy_guess_white = dummy_guess_red.compact

    k = 0
    while k < dummy_choice_white.length

      if dummy_choice_white.include?(dummy_guess_white[k])
        hints.push('white')
        dummy_choice_white.map do |value|
          value = nil if value == dummy_choice_white[k]
        end
        dummy_guess_white[k] = nil
      end
      k += 1
    end
    dummy_guess_empty = dummy_guess_white.compact
    l = 0
    while l < dummy_guess_empty.length
      hints.push(' ')
      l += 1
    end
    puts "Hints for you are: #{hints.shuffle}"
  end

  def result
    # p hints
    if hints.all? { |element| element == 'red' }
      puts 'Congratualtions you have guessed it correctly!!'
      true
    else
      puts 'Please try again!'
      self.hints = []
    end
  end
end
computer = Player.new('zolonsky', 'Computer')
human = Player.new('Nauman', 'Human')
game1 = Game.new(computer, human)
p game1.player1
game1.player2.howtoplay
game1.code_making
game1.code_breaking
