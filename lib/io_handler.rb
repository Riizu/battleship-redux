class IOHandler
  def display_welcome_message
    puts "Welcome to BATTLESHIP\n"
    print "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def prompt
    print "\n> "
    gets.chomp
  end
end
