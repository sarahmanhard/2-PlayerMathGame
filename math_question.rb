# Define a Ruby class named MathQuestion.
class MathQuestion
  # Create attributes for reading the question and answer.
  attr_reader :question, :answer

  # Constructor: Initialize a new MathQuestion object.
  def initialize
    generate_question
  end

  # Method to generate a random math question.
  def generate_question
    @num1 = rand(1..20)   # Generate a random number between 1 and 20.
    @num2 = rand(1..20)   # Generate another random number between 1 and 20.
    @answer = @num1 + @num2  # Calculate the correct answer.
    @question = "#{@num1} + #{@num2} = ?"  # Create a string representation of the question.
  end

  # Method to check if the player's answer is correct.
  def check_answer(player_answer)
    player_answer.to_i == @answer  # Convert the player's answer to an integer and compare with the correct answer.
  end

  # Method to provide a string representation of the question.
  def to_s
    @question
  end
end

# Example usage:
question = MathQuestion.new  # Create a new MathQuestion object.
puts "Question: #{question}"  # Display the generated math question.
player_answer = gets.chomp   # Read the player's answer from user input.

# Check if the player's answer is correct and provide feedback.
if question.check_answer(player_answer)
  puts "Correct!"
else
  puts "Incorrect. The correct answer is #{question.answer}."
end
