require 'open-uri'
require 'nokogiri'

class ScrapeLcfService
  def call(keyword)
    # build the url with the keyword
    url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?type=all&aqt=#{keyword}"
    # url = "./beef.html"
    # open the url using open-uri -> html
    html_content = open(url).read
    # Change the HTML into Nokogiri objects -> doc
    doc = Nokogiri::HTML(html_content, nil, 'utf-8')
    # search through the nokogiri objects
    # interate over the m_contenu_resultat class to build a recipe
    doc.search('.m_contenu_resultat').first(5).map do |recipe_card| #nokogiri obj
      name = recipe_card.search('.m_titre_resultat').first.text.strip
      details = recipe_card.search('.m_detail_recette').first.text.strip.split(" - ")
      description = details[1]
      prep_time = recipe_card.search('.m_prep_time').first.parent.text.strip
      difficulty = details[2]
      Recipe.new(
       name: name,
       description: description,
       prep_time: prep_time,
       difficulty: difficulty)
    end
  end
end
