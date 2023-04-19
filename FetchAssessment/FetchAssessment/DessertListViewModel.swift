//
//  DessertListViewModel.swift
//  FetchAssessment
//
//  Created by Uday Boyanapalli on 4/18/23.
//

import Foundation

@MainActor
class DessertListViewModel: ObservableObject {
    
    @Published var desserts: [DessertViewModel] = []

    func populateDessertData() async {
        if desserts.isEmpty {
            do {
                let dessert = try await Webservice().getDessert()
                self.desserts = dessert.meals.map { meal in
                    DessertViewModel(dessert: Dessert(meals: [meal]))
                }
                
            } catch {
                print(error)
            }
            
        }
    }
    
    
}

struct DessertViewModel: Identifiable {
    
    private var dessert: Dessert
    
    init(dessert: Dessert) {
        self.dessert = dessert
    }
    
    let id = UUID()
    
    var meals: [Meal] {
        dessert.meals
    }
    
    var firstMeal: Meal? {
        meals.first
    }
    
    var strMeal: String {
        firstMeal?.strMeal ?? ""
    }
    
    var strMealThumb: URL? {
        URL(string: firstMeal?.strMealThumb ?? "")
        
    }
    
    var idMeal: String {
        firstMeal?.idMeal ?? ""
    }
     
}
