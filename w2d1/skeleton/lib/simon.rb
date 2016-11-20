class Simon

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    game_over_message
    score = @sequence_length
    reset_game
    score
  end



  def take_turn
    system("clear")
    show_sequence
    sleep(1.5)
    if require_sequence == @seq
      round_success_message
      @sequence_length += 1
    else
      @game_over = true
    end

  end

  def show_sequence
    add_random_color
    @seq.each {|color| puts color}
  end

  def require_sequence
    system("clear")
    puts "Type one letter for each color in the sequence."
    input = gets.chomp
    colors = {"r" => "red", "y" => "yellow", "b" => "blue", "g" => "green"}
    input.split("").map {|letter| colors[letter.downcase]}

  end

  def add_random_color
    @seq << ["red", "blue", "green", "yellow"].sample
  end

  def round_success_message
    puts "Nice jorb"
  end

  def game_over_message
    puts "Derp. Game over."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

end
