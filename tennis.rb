module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Returns one point for the player
    def wins_ball(player)
      if player == 1
        @player1.record_won_ball!
      elsif player == 2
        @player2.record_won_ball!
      end 
    end
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball! 
      @points += 1
    end

    # Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'deuce' if @points == 3 && @opponent.points == 3
      return 'forty' if @points == 3
      return 'advantage' if ( (@points - @opponent.points) == 1 ) && (@opponent.points >= 3 )
      return 'win' if ( @points - @opponent.points >= 2 ) && (@points >= 4)
    end

  end
end

