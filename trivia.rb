require './db'
require 'catpix'
  class Game
    attr_accessor :db_id, :random, :score

    def initialize
      @db_id = 1
      @score = 0
      start_game

    end


    def start_game
      puts " -----------------------------X----------------------------"
      puts "|              Welcome and Get to ready to play            |"
      puts "|                 Answer with true or false.               |"
      puts " -----------------------------X----------------------------"
      print "Enter your name: "
      user_name = gets.chomp.to_s
      puts ""

      add_user_table(user_name)

      ask_question(@db_id, user_name, @score)
    end

    def ask_question(id, user_name, score)
      # puts id
      if id <= 5
        # puts "id is less than 5"
        # since id is less than 5 we are going to display the next question
        display_question(id)
        print "#{user_name}'s Answer: "
        user_input = gets.chomp.to_s.downcase
        puts ""
        # user_input.strip!



        validate = validate_answer?(id, user_input)

        # puts validate

        if validate == true
          id += 1
          # score += 1
          score = update_score(score, user_name)  # updates the score in the db table
          ask_question(id, user_name, score)
          # puts "You are right."
          # end

        else
          # puts " Try again!!!"
          id += 1
          ask_question(id, user_name, score)
          # return

        end
      else

          if score == "5"
          puts "You win! Yay!"
          puts "Your score is #{score} out of 5"
          puts "
                  ███         ███     ▄██████▄     ███    ███
                    ███     ███      ███    ███    ███    ███
                       █████         ███    ███    ███    ███
                        ███          ███    ███    ███    ███
                        ███           ▀██████▀      ▀██████▀

                 ███             ███      ███     ███▄▄▄▄
                 ███             ███      ███     ███▀▀▀██▄
                  ███    ███    ███       ███     ███   ███
                   ███   ███   ███        ███     ███   ███
                     ███     ███          ███     ███   ███ "
        else
          puts "You lose! Awww!"
          puts "Your score is #{score} out of 5"
        end

          # return
      end
    end

      # this code needs to go to db.rb file
  end

  trivia = Game.new
  Catpix::print_image "gameover.png"
