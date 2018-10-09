require 'gosu'
# require './snake_section.rb'

class SnakeHead < GameObject
  attr_accessor(:direction)

  def initialize(x, y)
    @x = x
    @y = y
    @icon = Gosu::Image.new('media/snake.png')
    @direction = Random.rand(4)
  end

  def update(h)
    x = @x
    y = @y

    case @direction
      when 0
        @y -= 1
      when 1
        @x += 1
      when 2
        @y += 1
      when 3
        @x -= 1
    end

    h.objects << SnakeSection.new(x, y, $score)

    obj = collision(h)
    unless obj.nil?
      if obj.class == Cherry
        obj.got!(h)
      else
        $gameover = true
      end
    end
  end

  def collision(h)
    h.objects.each do |obj|
      next if obj == self
      if ((obj.x.between?(@x-5, @x+5) && obj.y == @y) || (obj.x == @x && obj.y.between?(@y-5, @y+5))) && obj.class == Cherry
        return obj #hit cherry
      elsif obj.x == @x && obj.y == @y #hit itself
        return obj
      elsif obj.x > 600 || obj.x < 21 || obj.y > 441 || obj.y < 21
        return obj #hit wall?
      end
    end
    nil
  end

  def draw
    @icon.draw(x, y, 0)
  end
end