require 'gosu'

class Cherry < GameObject
  def initialize
    @icon = Gosu::Image.new('media/cherry.png')
    @x = Random.rand(21...600)
    @y = Random.rand(21...440)
    puts "#{@x}, #{@y}"

  end

  def got!(h)
    $score += 20
    @x = Random.rand(21...600)
    @y = Random.rand(21...440)
    puts "#{@x}, #{@y}"
    check_space(h)
    h.objects.each do |obj|
       if obj.class == SnakeSection
         obj.health += 1
       end
    end
  end

  def check_space(h)
    h.objects.each do |obj|
      next if obj == self
      if @x == obj.x && @y == obj.y
        @x = Random.rand(21...600)
        @y = Random.rand(21...440)
        puts "#{@x}, #{@y}"
        check_space(h)
      end
    end
  end

  def draw
    @icon.draw(x,y, 0)
  end
end