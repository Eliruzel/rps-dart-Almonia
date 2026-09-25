import 'dart:io';

/*
1. Display a title banner when the program starts.
2. Ask for Player 1's name, then Player 2's name.
3. Ask Player 1 to enter a move: rock, paper, or scissors.
4. After Player 1 enters a move, print about 30 blank lines using a loop. This hides Player
1's move so Player 2 cannot see it.
5. Ask Player 2 to enter a move.
6. Show both moves, then announce the winner of the round or declare a draw.
7. Show the current score of both players.
8. Ask whether they want to play again (y/n). Keep playing rounds until they answer n.
9. When the game ends, display the final score and the overall winner.
 */

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
  } else if ((move1 == 'rock' && move2 == 'scissors') ||
      (move1 == 'paper' && move2 == 'rock') ||
      (move1 == 'scissors' && move2 == 'paper')) {
    return 'player1';
  } else {
    return 'player2';
  }
}

void main() {
  while (run) {
    List<String> names = getPlayerName();
    
    print('--- Round ${round} ---');
    String? move1 = getMove(names[0]);
    for (int i = 0; i < 30; i++) {
      print('');
    }
    String? move2 = getMove(names[1]);

    print("${names[0]} chose $move1. ${names[1]} chose $move2.");
    String result = decideWinner(move1!, move2!);
    print("Result: $result");
    print()
  }


  /*
  ===== ROCK, PAPER, SCISSORS =====
  Enter Player 1 name: Ana
  Enter Player 2 name:
  (No name entered. Using "Player 2".)
  --- Round 1 ---
  Ana, enter your move (rock/paper/scissors): ROCK
  (screen cleared)
  Player 2, enter your move (rock/paper/scissors): papel
  Invalid move. Please type rock, paper, or scissors.
  Player 2, enter your move (rock/paper/scissors): paper
  Ana chose rock. Player 2 chose paper.
  Result: Player 2 wins the round!
  Score -> Ana: 0 | Player 2: 1
  Play again? (y/n): n
  ===== FINAL SCORE =====
  Ana: 0 | Player 2: 1
  Overall winner: Player 2
   */
}
