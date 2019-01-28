require_relative 'view'
require_relative 'recipe'
require_relative  'scrape_lcf_service'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    name = @view.ask_for('name')
    description = @view.ask_for('description')
    prep_time = @view.ask_for('prep time')
    difficulty = @view.ask_for('difficulty')
    recipe = Recipe.new(
               name: name,
               description: description,
               prep_time: prep_time,
               difficulty: difficulty
             )
    @cookbook.add(recipe)
  end

  def import
    keyword = @view.ask_for("ingredient you're looking for")
    recipes = ScrapeLcfService.new.call(keyword)
    # tell view to list the recipes
    @view.display(recipes)
    # get the index from the user
    index = @view.ask_for('number').to_i - 1
    # get recipe from recipes using the index
    recipe = recipes[index]
    # add recipe into cookbook
    @cookbook.add(recipe)
  end

  def mark
    # display recipes
    display_recipes
    # ask user which number
    index = @view.ask_for('number').to_i - 1
    # mark as done!
    recipe = @cookbook.find(index)
    recipe.mark_as_done!
    # save csv
    @cookbook.save_csv
  end

  def destroy
    display_recipes
    index = @view.ask_for('number').to_i - 1
    @cookbook.remove(index)
  end

  private

  def display_recipes
    recipes = @cookbook.all
    @view.display(recipes)
  end
end








