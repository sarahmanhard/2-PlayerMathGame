# main.rb
require_relative 'player'
require_relative 'math_question'
require_relative 'game'
require_relative 'input_handler'  # Make sure to include this line if you have an InputHandler class
require_relative 'output_handler' # Make sure to include this line if you have an OutputHandler class


# Create player objects
player1 = Player.new("Player 1")
player2 = Player.new("Player 2")

# Create a new game with the players
game = Game.new(player1, player2)

# Start the game
game.start_game
