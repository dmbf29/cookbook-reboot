require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    # ask user for name
    name = @view.ask_for('name')
    # ask user for description
    description = @view.ask_for('description')
    # create an instance with that name and description
    recipe = Recipe.new(name, description)
    # add to cookbook
    @cookbook.add(recipe)
  end

  def destroy
    # show the list
    display_recipes
    # ask user which one they want to destroy
    index = @view.ask_for('number').to_i - 1
    # tell the cookbook to destroy
    @cookbook.remove(index)
  end

  private

  def display_recipes
    # ask our cookbook for the recipes
    recipes = @cookbook.all
    # tell the view to display the recipes
    @view.display(recipes)
  end
end








