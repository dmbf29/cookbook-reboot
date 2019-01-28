class Recipe
  attr_reader :name, :description, :prep_time, :difficulty

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @prep_time = attributes[:prep_time]
    @difficulty = attributes[:difficulty]
    @done = attributes[:done] || false
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = !@done
  end

  def to_a
    [@name, @description, @prep_time, @difficulty, @done]
  end
end
