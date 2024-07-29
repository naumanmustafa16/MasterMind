# require_relative '../game'

class Player
  attr_accessor :name, :type

  def initialize(name, type)
    @name = name
    @type = type
  end

  def howtoplay
    puts type == 'Computer' ? 'Computer will choose the colors' : 'Human will make a guess'
  end
end

# p computer
# p human
# computer.play
