class Rover

  def initialize(x_location, y_location, direction)
    @x_location = x_location
    @y_location = y_location
    @direction  = direction
  end

  # READERS
  def x_location
    @x_location
  end

  def y_location
    @y_location
  end

  def direction
    @direction
  end

  # WRITERS
  def direction=(direction)
    @direction = direction
  end

  def x_location=(x_location)
    @x_location = x_location
  end

  def y_location=(y_location)
    @y_location = y_location
  end

  # INSTANCE METHODS
  def move
    if @direction == "N"
      @y_location += 1
    elsif @direction == "S"
      @y_location -= 1
    elsif @direction == "E"
      @x_location += 1
    else
      @x_location -= 1
    end
  end

  def turn(input)
    if input == 'L'
      if @direction == 'N'
        @direction = 'W'
      elsif @direction == 'W'
        @direction = 'S'
      elsif @direction == 'S'
        @direction = 'E'
      else
        @direction = 'N'
      end
    else
      if @direction == 'N'
        @direction = 'E'
      elsif @direction == 'W'
        @direction = 'N'
      elsif @direction == 'S'
        @direction = 'W'
      else
        @direction = 'S'
      end
    end
  end

  def instructions(string)
    characters = string.chars

    characters.each do |char|
      if char == "L"
        turn("L")
      elsif char == "R"
        turn("R")
      elsif char == "M"
        move
      end
    end
  end

end

rover = Rover.new(1, 2, "N")

  while true
    puts "Where to next, Space Commander?"
    user_input = gets.chomp
    rover.instructions(user_input)
    puts "Your new coordinates are #{rover.inspect}"

    if user_input == 'home'
      puts "Safe journey home, Commander"
      break
    end
end

# my_rover = Rover.new(3, 3, "E")
# my_rover.instructions('MMRMMRMRRM')
# puts my_rover.inspect
