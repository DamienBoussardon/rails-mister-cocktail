require 'json'
require 'open-uri'

puts "destroy"
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all


url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks = open(url).read

result = JSON.parse(drinks)
result["drinks"].each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
end
puts "done"


puts "destroy cocktail"
Cocktail.destroy_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
drinks = open(url).read

result = JSON.parse(drinks)
result["drinks"].each do |drink|
  Cocktail.create!(name: drink["strDrink"], picture: "http://#{drink["strDrinkThumb"]}")
end
puts "done cocktail"

