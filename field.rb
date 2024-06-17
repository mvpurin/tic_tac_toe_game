class Field
  attr_reader :area

  def initialize
    @area = Hash[(1..9).map { |num| [num, num] }]
  end

  def show
    @area.values.each_slice(3) { |slice| puts slice.join(" ") }
  end

  def fill_in(field_num, field_value)
    @area[field_num] = field_value if check(field_num, field_value)
  end

  def check(num, value)
    (1..9).include?(num) && (value == "X" || value == "x" || value == "0")
  end
end
