module InstructionsHandler
  def self.instructions
    "Battleship is a two-player game where both players have a collection\n" +
    "of ships arranged on a grid. Each player takes turns guessing at the\n" +
    "location of their opponent's vessels. If a guess is correct, it is a\n" +
    "'hit', otherwise it is a 'miss'. Below is a simple example of a game\n" +
    "in progress:\n\n" +
    "======================================\n" +
    "|      A | B | C |  D |  E |  F |  G |      * = ship\n" +
    "|===|====|===|===|====|====|====|====|     H = Hit\n" +
    "| 1 |  * | * | * |    |    |    |    |     M = Miss\n" +
    "|===|====|===|===|====|====|====|====|\n" +
    "| 2 |    |   |   |    |    |    |    |\n" +
    "|===|====|===|===|====|====|====|====|\n" +
    "| 3 |    | M |   |    |    | *  |    |\n" +
    "|===|====|===|===|====|====|====|====|\n" +
    "| 4 |    | M |   |    |    | H  | M  |\n" +
    "|===|====|===|===|====|====|====|====|\n" +
    "| 5 |    | M |   |    |    |    |    |\n" +
    "|===|====|===|===|====|====|====|====|\n" +
    "| 6 |    |   |   |    |    |    |    |\n" +
    "|===|====|===|===|====|====|====|====|\n" +
    "| 7 |    |   |   |    |    |    |    |\n" +
    "|===|====|===|===|====|====|====|====|\n\n" +
    "If all spots a ship occupies are guessed, that ship is 'sunk' and no\n" +
    "longer in the game. If a player runs out of ships, they lose the game."
  end
end
