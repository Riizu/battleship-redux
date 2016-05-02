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
    puts "#{string}\n\n"
  end

  def get_ship_coords(size)
    puts "Enter the squares for the #{size}-unit ship: "
    gets.chomp
  end
end
