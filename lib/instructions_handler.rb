module InstructionsHandler
  def self.instructions
    "Battleship is a two-player game where both players have a collection\n" +
    "of ships arranged on a grid. Each player takes turns guessing at the\n" +
    "location of their opponent's vessels. If a guess is correct, it is a\n" +
    "'hit', otherwise it is a 'miss'. Below is a simple example of a game\n" +
    "in progress:\n\n" +
    "     1 2 3 4         * = ship\n" +
    "--------------       H = Hit\n" +
    " A | H   H H |       M = Miss\n" +
    " B |         |\n" +
    " C |     M   |\n" +
    " D |     M   |\n" +
    "--------------\n\n" +
    "     1 2 3 4  \n" +
    "--------------\n" +
    " A |   S S S |\n" +
    " B | H       |\n" +
    " C | S   M   |\n" +
    " D |     M   |\n" +
    "--------------\n\n" +
    "The above displays two grids - your guesses above, and your ships and\n" +
    "opponent's guesses below.\n" +
    "If all spots a ship occupies are guessed, that ship is 'sunk' and no\n" +
    "longer in the game. If a player runs out of ships, they lose the game."
  end
end
