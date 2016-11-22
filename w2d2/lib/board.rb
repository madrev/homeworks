require_relative 'player'
require 'byebug'
class Board
  attr_accessor :cups, :player1, :player2

  def initialize(name1, name2)
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    @cups.each_index do |idx|
      next if [6,13].include?(idx)
      cups[idx] = [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    unless (1..12).cover?(start_pos)
      raise "Invalid starting cup"
    end
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    cup_idx = start_pos
    hand = @cups[cup_idx]
    @cups[cup_idx] = []
    deposit_cup = start_pos

    until hand.empty?
      deposit_cup += 1
      deposit_cup %= 14
      unless (deposit_cup == 6 && current_player_name == @player2.name) ||
         (deposit_cup == 13 && current_player_name == @player1.name)
        @cups[deposit_cup] << hand.pop
      end

    end

    render
    ending_cup_idx = deposit_cup
    next_turn(ending_cup_idx)
  end

  def next_turn(ending_cup_idx)
    if [6,13].include?(ending_cup_idx)
       :prompt
    elsif @cups[ending_cup_idx].size == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[7..12].all? {|cup| cup.empty?} || @cups.take(6).all? {|cup| cup.empty?}
  end

  def winner
    case @cups[6] <=> @cups[13]
    when -1
      @player2.name
    when 1
      @player1.name
    when 0
      :draw
    end
  end
end
