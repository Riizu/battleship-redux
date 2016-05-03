class IOHandler
  def display_welcome_message
    puts "Welcome to BATTLESHIP\n"
  end

  def prompt
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
    print "> "
  end

  def get_repl_input
    prompt
    gets.chomp[0].capitalize
  end

  def display_message(string)
    puts "\n#{string}\n"
  end

  def display_start_game_message
    puts "I have laid out my ships on the grid.\n" +
         "You now need to layout your two ships.\n" +
         "The first is two units long and the second is three units long.\n" +
         "The grid has A1 at the top left and D4 at the bottom right.\n\n"
  end

  def display_grid(grid)
    puts "\n    A B C D\n"
    puts "-------------"
    grid.length.times do |x|
      print "#{x+1} | "
      grid[0].length.times do |y|
        print "#{grid[x][y]} "
      end
      print "|\n"
    end
    puts "-------------\n"
  end

  def get_ship_positions(size)
    puts "\nEnter the squares for the #{size}-unit ship: "
    input = gets.chomp
    input_array = input.split(" ")
    sanitize_input_into_array_indices(input_array)
  end

  def get_shot_position
    puts "\nEnter a target: "
    input = gets.chomp
    sanitize_input_into_array_indices([input])[0]
  end

  def sanitize_input_into_array_indices(input)
    letters = ["A", "B", "C", "D"]
    numbers = [1, 2, 3, 4]
    result = []

    input.each do |current|
      coordinate = current.split(//, 2)
      coordinates = []

      coordinates << letters.find_index {|letter| letter == coordinate[0] }
      coordinates << numbers.find_index {|number| number == coordinate[1].to_i }

      if !coordinates[0].nil? && !coordinates[1].nil?
        result << coordinates
      end
    end
    result
  end
end
