class View
  def display(recipes) # an array of instances
    recipes.each_with_index do |recipe, index|
      x_mark = recipe.done? ? "[X]" : "[ ]"
      puts "#{index + 1} #{x_mark} #{recipe.name} - #{recipe.description}"
      puts " -> #{recipe.prep_time} | #{recipe.difficulty}"
    end
  end

  def ask_for(thing)
    puts "What's the #{thing}?"
    return gets.chomp
  end
end
