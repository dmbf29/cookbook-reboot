class Recipe
  attr_reader :name, :description

  def initialize(name, description)
    @name = name
    @description = description
  end

  def to_a
    [@name, @description]
  end
end
