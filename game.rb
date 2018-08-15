require_relative 'questions'
require_relative 'players'

class Game

  attr_accessor :player1, :player2

  def initialize
    @players = []
    @players.push(Player.new(1))
    @players.push(Player.new(2))
    @p1      = @players[0]
    @p2      = @players[1]
  end

  def game_start
    puts "------ START GAME ------"
    @players.cycle do |player|
      if @p1.lives > 0 && @p2.lives > 0
        q = Question.new
        puts "Player #{player.name}:"
        puts "#{q.question}"
        answer = q.answer

        if answer == q.correct_answer
          puts "Player #{player.name}: Yes, surprisingly thats correct!"
          puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
          puts "----------------------"
        else
          puts "Player #{player.name}: No, thats wrong and you lose a life!"
          player.lives -= 1
          puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
          puts "----------------------"
        end

      else
        if @p1.lives == 0
          puts "Player 2 wins with a score of #{@p2.lives}/3"
          puts "------- GAME OVER -------"
          break
        else @p2.lives == 0
          puts "Player 1 wins with a score of #{@p1.lives}/3"
          puts "------- GAME OVER -------"
          break
        end

      end

    end

  end

  def new_turn
      puts "------ NEW TURN ------"
      q = Question.new
      q.question
  end


end

n = Game.new
p n.game_start
