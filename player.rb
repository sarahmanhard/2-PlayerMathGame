# Define a Ruby class named Player.
class Player
  # Create attributes for reading the player's name, number of lives, and score.
  attr_reader :name, :lives, :score

  # Constructor: Initialize a new Player object with a name.
  def initialize(name)
    @name = name      # Store the player's name.
    @lives = 3        # Initialize the number of lives to 3 by default.
    @score = 0        # Initialize the player's score to 0.
  end

  # Method to decrease the player's number of lives by 1.
  def lose_life
    @lives -= 1
  end

  # Method to check if the player is still alive (has more than 0 lives).
  def is_alive?
    @lives > 0
  end

  # Method to retrieve the player's current score.
  def get_score
    @score
  end

  # Method to decrease the player's score by a specified number of points.
  def lower_score(points)
    @score -= points
  end

  # Method to convert the player's score to an integer.
  def to_i
    @score.to_i
  end
end

# Example usage:
player1 = Player.new("Player 1")  # Create a new Player object with the name "Player 1".
puts "#{player1.name} has #{player1.lives} lives and a score of #{player1.get_score}"  # Display player information.

player1.lose_life  # the player loses a life.
puts "#{player1.name} lost a life. Lives remaining: #{player1.lives}"  # Display updated lives.

# Check if the player is still alive 
puts "#{player1.name} is still alive!" if player1.is_alive?
