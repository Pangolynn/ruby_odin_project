# Tic Tac Toe game
class Tictactoe
  attr_accessor :game_over, :turns, :winner, :player_turn, :players

  def initialize
    @player_turn = 0
    @turns = 0
    @winner = ''
    @game_over = false
    @players = Array.new(2)
  end

  def input_player_name
    gets.chomp.to_s
  end
end

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(9, '*')
  end

  def print_board
    @board.each_with_index do |x, i|
      puts "\n" if (i % 3).zero?
      print "#{x} "
    end
  end

  def update_board(move, sym)
    p "#{move} #{sym}"
    @board[move] = sym
    p @board[move]
  end

  def valid_move?(move)
    @board[move] == '*'
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

class Player
  attr_accessor :name, :choices, :sym

  def initialize(name)
    @name = name
    @sym = ''
    @choices = []
  end

  def move
    gets.chomp.to_i
  end
end

b = Board.new
b.print_board
t = Tictactoe.new
puts "\nEnter player 1's name"
p1 = Player.new(t.input_player_name)
p "Enter player 2's name"
p2 = Player.new(t.input_player_name)

# Determine who goes first and assign their symbol
if rand(2) == 1
  p1.sym = 'X'
  p2.sym = 'O'
  player_turn = 1
  puts "Player 1 #{p1.name} goes first with X"
else
  p1.sym = 'O' 
  p2.sym = 'X'
  player_turn = 2
  puts "Player 2 #{p2.name} goes first with X"
end

until t.game_over || t.turns >= 9
  if player_turn == 1
    puts "Player 1 #{p1.name}'s turn."
    move = p1.move
    move = p1.move until b.valid_move?(move)
    b.update_board(move,p1.sym)
    p1.choices.push(move)
    t.turns += 1
    b.print_board
    b.winner?(p1.choices) ? (puts "#{p1.name} wins! Play Again?"; t.game_over = true) : player_turn = 2
    # player_turn = 2
  else
    puts "Player 2 #{p2.name}'s turn."
    move = p2.move
    move = p2.move until b.valid_move?(move)
    b.update_board(move, p2.sym)
    p2.choices.push(move)
    t.turns += 1
    b.print_board
    b.winner?(p2.choices) ? (puts "#{p2.name} wins! Play Again?"; t.game_over = true) : player_turn = 1
  end
  t.turns >= 9 ? "\nDraw! No winner :(. Play Again?" : 'Play Again?'
end
