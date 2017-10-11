require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      unless idx == 6 || idx == 13
        4.times {|i| cup << :stone}
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !(0..12).include?(start_pos)
    raise "Empty cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    off_limits_cup = current_player_name == @name1? 13 : 6
    current_cup = start_pos
    stones = @cups[start_pos]

    until stones.empty?
      current_cup += 1
      current_cup = 0 if current_cup > 13
      unless current_cup == off_limits_cup
        @cups[current_cup] << stones.pop
      end
    end

    self.render
    next_turn(current_cup)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
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
    @cups[0..5].all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_score = @cups[6].length
    player2_score = @cups[13].length

    return :draw if player1_score == player2_score

    if player1_score > player2_score
      winner = @name1
    else
      winner = @name2
    end

    winner
  end
end
