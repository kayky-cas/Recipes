//
//  RecipeRepositoryMock.swift
//  Recipes
//
//  Created by unicred on 06/01/23.
//

import Foundation

class RecipeRepositoryMock {
	static let shared = RecipeRepositoryMock()
	
	private var recipes: [Recipe] = [
		Recipe(
			title: "Panqueca de carne moida",
			description: "Essa receita individual de panqueca é feita no liquidificador, leva farinha de aveia na massa e tem um recheio suculento de carne moída. Todo o preparo não leva mais do que 30 minutos e você pode caprichar nos temperos que tiver em casa e até substituir o recheio de carne por outro de sua preferência. A receita é prática, você vai adorar!",
			howToMake: [
				"Comece separando os ingredientes da sua panqueca de carne fit. Essa é uma porção individual, mas você pode dobrar a quantidade de ingredientes e preparar para mais pessoas se desejar!",
				"Vamos começar preparando o recheio de carne moída. Leve uma panela ao fogo médio, despeje o azeite e doure o alho. Em seguida acrescente o tomate picado e o cominho",
				"Junte a carne moída, tempere com sal e pimenta a gosto e cozinhe até a carne ficar marrom. Despeje o molho de tomate, misture bem e cozinhe por mais 1 minuto.",
				"Agora vamos preparar a massa que é bem simples: é só bater todos os ingredientes no liquidificador até formar uma mistura homogênea.",
				"Leve uma frigideira ao fogo médio, coloque um pouquinho de azeite se achar necessário e despeje uma porção da massa - ela fica bem líquida mesmo, tá? Doure dos dois lados da panqueca e pronto!",
				"Prepare hoje mesmo essa panqueca de carne e bom apetite!",
			]
		)
	]
	
	func getRecipes(completion: @escaping ([Recipe]) -> Void) {
		completion(recipes)
	}
	
	func addRecipes(recipe: Recipe) {
		recipes.append(recipe)
	}
}
