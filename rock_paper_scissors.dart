import 'dart:io';

const List<String> moves = ['rock', 'paper', 'scissors'];
bool run = true;
int round = 1;
int scorePlayer1 = 0;
int scorePlayer2 = 0;

List<String> getPlayerName() {
  stdout.write('Enter player 1 name: ');
  String? name = stdin.readLineSync();

  if (name == null || name.isEmpty) {
    print('(No name entered. Using "Player 1".)');
    name = 'Player 1';
  }

  stdout.write('Enter player 2 name: ');
  String? name2 = stdin.readLineSync();

  if (name2 == null || name2.isEmpty) {
    print('(No name entered. Using "Player 2".)');
    name2 = 'Player 2';
  }

  return [name, name2];
}

String? getMove(String playerName) {
  String? move;

  while (true) {
    stdout.write('$playerName, enter your move (rock/paper/scissors): ');
    move = stdin.readLineSync();

    if (move == null || !moves.contains(move.toLowerCase())) {
      print('Invalid move. Please type rock, paper, or scissors.');
    } else {
      break;
    }
  }

  return move.toLowerCase();
}

String decideWinner(String move1, String move2) {
  if (move1 == move2) {
    return 'draw';
  }

  if (move1 == 'rock') {
    if (move2 == 'scissors') {
      scorePlayer1++;
      return 'player1';
    }
  } else if (move1 == 'paper') {
    if (move2 == 'rock') {
      scorePlayer1++;
      return 'player1';
    }
  } else if (move1 == 'scissors') {
    if (move2 == 'paper') {
      scorePlayer1++;
      return 'player1';
    }
  }

  scorePlayer2++;
  return 'player2';
}

void main() {
  print('===== ROCK, PAPER, SCISSORS =====');

  List<String> names = getPlayerName();

  while (run) {
    print('\n--- Round $round ---');

    String? move1 = getMove(names[0]);

    for (int i = 0; i < 30; i++) {
      print('');
    }

    String? move2 = getMove(names[1]);

    print('${names[0]} chose $move1. ${names[1]} chose $move2.');

    String result = decideWinner(move1!, move2!);

    if (result == 'draw') {
      print('Result: Draw!');
    } else if (result == 'player1') {
      print('Result: ${names[0]} wins the round!');
    } else {
      print('Result: ${names[1]} wins the round!');
    }

    print(
      'Score -> ${names[0]}: $scorePlayer1 | ${names[1]}: $scorePlayer2',
    );

    stdout.write('Play again? (y/n): ');
    String? answer = stdin.readLineSync();

    if (answer == null || answer.toLowerCase() == 'n') {
      run = false;
    } else {
      round++;
    }
  }

  print('\n===== FINAL SCORE =====');
  print('${names[0]}: $scorePlayer1 | ${names[1]}: $scorePlayer2');

  if (scorePlayer1 > scorePlayer2) {
    print('Overall winner: ${names[0]}');
  } else if (scorePlayer2 > scorePlayer1) {
    print('Overall winner: ${names[1]}');
  } else {
    print('Overall result: Draw!');
  }
}