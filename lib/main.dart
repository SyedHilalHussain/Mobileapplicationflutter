import 'dart:io';
import 'dart:math';

void main() {
  // Step 1: Generate a random number between 1 and 100
  final random = Random();
  final int targetNumber = random.nextInt(100) + 1;

  // Step 2: Initialize the number of attempts
  int attempts = 0;
  bool guessedCorrectly = false;

  print('Welcome to the Number Guessing Game!');
  print('I have selected a number between 1 and 100. Can you guess it?');

  // Step 3: Loop until the player guesses the correct number
  while (!guessedCorrectly) {
    // Step 4: Prompt the player to enter a guess
    stdout.write('Enter your guess: ');
    String? input = stdin.readLineSync();

    // Validate input
    if (input == null || input.isEmpty) {
      print('Please enter a valid number.');
      continue;
    }

    // Convert the input to an integer
    int? guess;
    try {
      guess = int.parse(input);
    } catch (e) {
      print('Invalid input. Please enter a number.');
      continue;
    }

    // Step 5: Increment the number of attempts
    attempts++;

    // Step 6: Provide feedback
    if (guess < targetNumber) {
      print('Too low! Try again.');
    } else if (guess > targetNumber) {
      print('Too high! Try again.');
    } else {
      guessedCorrectly = true;
      print('Congratulations! You guessed the correct number $targetNumber in $attempts attempts.');
    }
  }
}
