class View
  def display(recipes) # an array of instances
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} | #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_for(thing)
    puts "What's the #{thing}?"
    return gets.chomp
  end
end
