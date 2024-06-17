require "./game.rb"
require "./field.rb"

class Interface
  def initialize
    puts "Hello!"

    loop do
      puts "Press 1 to start the game: "
      puts "Press other key to exit: "
  
      gets.chomp.to_i == 1 ? start : break

      puts "Press 1 to start the game: "
      puts "Press other key to exit: "
      gets.chomp.to_i == 1 ? start : break
    end
  end

  def start
    @game = Game.new

    loop do
      puts "\n"
      @game.field.show
      puts "\n"
      break if @game.make_move_and_check
    end
  end
end