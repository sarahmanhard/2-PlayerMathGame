# Define a Ruby class named Game.
class Game
  # Constructor: Initialize the game with two player objects, 'player1' and 'player2'.
  def initialize(player1, player2)
    @players = [player1, player2]  # Store player objects in an array.
    @current_player_index = 0     # Initialize the index of the current player to 0 (player1).
    @game_over = false            # Initialize the game_over status as false (game is not over).
  end

  # Method to start the game.
  def start_game
    puts "Welcome to the Math Game!"

    until @game_over
      current_player = @players[@current_player_index]  # Get the current player.
      other_player = @players[1 - @current_player_index] # Get the other player.

      puts "\n#{current_player.name}'s turn:"
      math_question = MathQuestion.new                     # Create a new math question.
      puts "Question: #{math_question}"

      player_answer = InputHandler.get_input.to_i          # Get player's answer from user input.

      if math_question.check_answer(player_answer)         # Check if the answer is correct.
        puts "Correct!"
      else
        puts "Incorrect! #{current_player.name} loses a life."
        current_player.lose_life                           # Reduce the current player's life on incorrect answer.
      end

      OutputHandler.display_output("\nScores:")
      display_scores                                       # Display player scores.

      @game_over = true unless current_player.is_alive?    # Check if the current player is still alive.
      switch_player                                        # Switch to the other player for the next turn.
    end

    announce_winner  # Declare the winner when the game is over.
  end

  private

  # Method to switch the current player.
  def switch_player
    @current_player_index = 1 - @current_player_index  # Toggle between 0 and 1 to switch players.
  end

  # Method to display the scores of all players.
  def display_scores
    @players.each do |player|
      OutputHandler.display_output("#{player.name}: Lives - #{player.lives}, Score - #{player.get_score}")
    end
  end

  # Method to announce the winner and loser at the end of the game.
  def announce_winner
    winner = @players.find { |player| player.is_alive? } # Find the player who is still alive (the winner).
    loser = @players.find { |player| !player.is_alive? } # Find the player who is not alive (the loser).

    OutputHandler.display_output("\n#{winner.name} wins with #{winner.lives} lives and a score of #{winner.get_score}!")
    OutputHandler.display_output("#{loser.name} had a score of #{loser.get_score}. Better luck next time.")
  end
end
