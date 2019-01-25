require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = [] # an array of recipe INSTANCES
    load_csv
  end

  def add(recipe)
    @recipes << recipe
    save_csv
  end

  def all
    @recipes
  end

  def remove(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        # csv << [recipe.name, recipe.description]
        csv << recipe.to_a
      end
    end

  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end
end










