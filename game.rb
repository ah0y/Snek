require 'gosu'
require './game_object.rb'
require './snake_head.rb'
require './cherry.rb'
require './handler.rb'
require './snake_section.rb'

class Snek < Gosu::Window
  def initialize
    super 640, 480
    $score = 0
    $gameover = false
    self.caption = 'Snek'
    @handler = Handler.new
    @snake = SnakeHead.new(640/2, 480/2)
    @cherry = Cherry.new
    @handler.objects << @snake
    @handler.objects << @cherry
  end


  def update
    @snake.update(@handler)
    @handler.update
  end

  def draw
    unless $gameover
      @handler.draw
    else
      puts "#{$score}"
    end
  end


  def button_down(id)
    case id
      when Gosu::KB_UP
        # or Gosu::button_down? Gosu::GP_BUTTON_0
        @snake.direction = 0 unless @snake.direction == 2
      when Gosu::KB_LEFT
        # or Gosu::button_down? Gosu::GP_LEFT
        @snake.direction = 3 unless @snake.direction == 1
      when Gosu::KB_DOWN
        # or Gosu::button_down? Gosu::GP_DOWN
        @snake.direction = 2 unless @snake.direction == 0
      when Gosu::KB_RIGHT
        # or Gosu::button_down? Gosu::GP_RIGHT
        @snake.direction = 1 unless @snake.direction == 3
      when Gosu::KB_RETURN
        if $gameover
          $gameover = false
          $score = 0
          @handler = Handler.new
          @snake = SnakeHead.new(640/2, 480/2)
          @cherry = Cherry.new
          @handler.objects << @snake
          @handler.objects << @cherry
        end
    end
  end

  # def score_plus
  #   $score += 1
  #   # $gamespeed *= 0.9875
  # end
end

Snek.new.show