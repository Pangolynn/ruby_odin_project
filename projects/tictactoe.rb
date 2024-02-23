# This class represents the game logic for Tic Tac Toe 
#
# To play a game, create a new instance of TicTacToe with 2 Player objects
# and a board.
# Its attr are game_over, turns, player_turn, players, and board
# Use #setup to setup the Player's turns and symbols, and then #play to start the game
# Example usage:
#   t = TicTacToe.New
#   t.setup
#   t.play
class Tictactoe
  attr_accessor :game_over, :turns, :player_turn, :players, :board

  def initialize
    @player_turn = 0
    @turns = 0
    @game_over = false
    @players = Array.new(2)
    @board = Board.new
  end

  def self.input_player_name
    name = ''
    name = gets.chomp.strip while name.empty?
    name
  end

  def setup
    puts "\nEnter player 1's name"
    @players[0] = Player.new(Tictactoe.input_player_name)
    puts "\nEnter player 2's name"
    @players[1] = Player.new(Tictactoe.input_player_name)
    @board.print_board
    determine_symbol
  end

  def play
    move = -1

    if @player_turn == 1
      puts "Player 1 #{@players[0].name}'s turn."
      move = @players[0].move until @board.valid_move?(move)
      @board.update_board(move,@players[0].sym)
      @players[0].choices.push(move)
      @turns += 1
      @board.print_board
      @board.winner?(@players[0].choices) ? (puts "#{@players[0].name} wins! Play Again?"; @game_over = true) : @player_turn = 2
    else
      puts "Player 2 #{@players[1].name}'s turn."
      move = @players[1].move until @board.valid_move?(move)
      @board.update_board(move, @players[1].sym)
      @players[1].choices.push(move)
      @turns += 1
      @board.print_board
      @board.winner?(@players[1].choices) ? (puts "#{@players[1].name} wins! Play Again?"; @game_over = true) : @player_turn = 1
    end
    return unless @turns >= 9 || @game_over

    @game_over = true
    puts "\nDraw! No winner :(. Play Again?" if @turns >= 9
  end

  private

  # Decides which player goes first, and assigns a random symbol
  def determine_symbol
    first, second = @players.shuffle
    first.sym, second.sym = %w[X O].shuffle
    @player_turn = @players.index(first) + 1
    puts "\nPlayer #{@player_turn} #{first.name} goes first with #{first.sym}"
  end
end

# This class represents a 3x3 Tic Tac Toe board
#
# It has a board attribute.
# You can create a new board by calling Board.new
# Example usage:
#   board = Board.new
class Board
  def initialize
    @board = Array.new(9, '*')
  end

  def print_board
    @board.each_with_index do |x, i|
      print "\n - - - - - -\n|" if (i % 3).zero?

      print " #{x} |"
    end
    print "\n - - - - - -\n"
  end

  def update_board(move, sym)
    @board[move] = sym
  end

  def valid_move?(move)
    # p move
    if move >= 9 || move.negative?
      puts 'Enter a number between 0-8'
      return false
    elsif @board[move] != '*'
      puts 'That spot is taken. Select an empty spot'
      return false
    end
    true
  end

  def winner?(choices)
    [0, 1, 2].all? { |n| choices.include?(n) } ||
      [3, 4, 5].all? { |n| choices.include?(n) } ||
      [6, 7, 8].all? { |n| choices.include?(n) } ||
      [0, 3, 6].all? { |n| choices.include?(n) } ||
      [1, 4, 7].all? { |n| choices.include?(n) } ||
      [2, 5, 8].all? { |n| choices.include?(n) } ||
      [0, 4, 8].all? { |n| choices.include?(n) } ||
      [2, 4, 6].all? { |n| choices.include?(n) }
  end
end

# This class represents a Player for the Tic tac toe game
#
# Players have name, sym (X or O), and choices (moves they've previously made) attributes
# To create a player, pass in a name, and then you can seperately update their symbol.
# Example usage:
#   player_one = Player.new("Sam")
#   player_one.sym = "X"
class Player
  attr_accessor :name, :choices, :sym

  def initialize(name)
    @name = name
    @sym = ''
    @choices = []
  end

  def move
    input = gets.strip.chomp
    return input.to_i if input.match?(/\A[0-8]\z/)

    puts 'Invalid input.'
    -1
  end
end

# module Game is a driver to control the flow of the Tictactoe game
# Its purpose is to start a new tictactoe game and replay based on user input
# Example usage:
#   Game.start
module Game 
  def self.replay?
    response = ''
    response = gets.strip.chomp while response.empty?
    response.downcase == 'y' || response.downcase == 'yes'
  end

  def self.start
    play_again = true
    while play_again
      t = Tictactoe.new
      t.setup
      t.play until t.game_over
      play_again = replay?
    end
  end
end

Game.start
