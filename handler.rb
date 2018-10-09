require 'gosu'

class Handler
  attr_accessor(:objects)

  def initialize
    @objects = []
    puts 'yea!'
  end

  # def update
  #   @objects.each {|obj| obj.tick self}
  # end
  #
  def draw
    @objects.each {|obj| obj.draw }
  end

  def update
    @objects.each do |obj|
      obj.health -= 1 if obj.class == SnakeSection
      if obj.class == SnakeSection && obj.health < 0
        @objects.delete(obj)
      end
    end
  end
end