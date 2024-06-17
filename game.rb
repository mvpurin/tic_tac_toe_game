require "./field.rb"

class Game
  attr_reader :field

  def initialize
    @field = Field.new
  end

  def make_move_and_check
    puts "Choose a field: "
    field_num = gets.chomp.to_i
    puts "x or 0?"
    field_value = gets.chomp
    field_value = "x" if field_value == "X"
    @field.fill_in(field_num, field_value)

    return true if finish?(field_num)
  end

  private

  def finish?(num)
    find_horizontal_interval(num)
    return true if horizontal?(num)
    return true if vertical?(num)
    return true if diagonal?
  end

  def find_horizontal_interval(num)
    if (1..3).include?(num)
      @hor_int = [1,2,3]
    elsif (4..6).include?(num)
      @hor_int = [4,5,6]
    elsif (7..9).include?(num)
      @hor_int = [7,8,9]
    end
  end

  def horizontal?(num)
    @field.area.values_at(*@hor_int).uniq.size == 1
  end

  def vertical?(num)
    if @hor_int == [1,2,3]
      vert_int = [num, num + 3, num + 6]
    elsif @hor_int == [4,5,6]
      vert_int = [num - 3, num, num + 3]
    elsif @hor_int == [7,8,9]
      vert_int = [num - 6, num - 3, num]
    end
    @field.area.values_at(*vert_int).uniq.size == 1
  end

  def diagonal?
    @field.area.values_at(*[1,5,9]).uniq.size == 1 || 
      @field.area.values_at(*[3,5,7]).uniq.size == 1
  end
end