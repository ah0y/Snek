require 'gosu'
class SnakeSection <GameObject
  attr_accessor(:health)

  def initialize(x, y, health)
    @x = x
    @y = y
    @health = health
    @icon = Gosu::Image.new('media/snake.png')
  end

  def update(h)
    @health -= 20
    h.objects.delete(self) if health < 0
  end

  def draw
    @icon.draw(x, y, 0)
  end
end