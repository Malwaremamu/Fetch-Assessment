//
//  MealDetailViewModel.swift
//  FetchAssessment
//
//  Created by Uday Boyanapalli on 4/18/23.
//

import Foundation

@MainActor
class MealDetailViewModel: ObservableObject {
    
    @Published var mealDetails: [MealViewModel] = []
    
    func populateMealDetails(_ mealIdString: String) async {
        do {
            let mealDetail = try await Webservice().getMealDetails(mealIdString)
            self.mealDetails =  mealDetail.meals.map { mealId in
                MealViewModel(mealDetails: MealDetails(meals: [mealId]))
            }
        } catch {
            print(error)
        }
    }
}
    
struct MealViewModel: Identifiable {

    private var mealDetails: MealDetails

    init(mealDetails: MealDetails) {
        self.mealDetails = mealDetails
    }

    let id = UUID()

    var mealIdDetails: [MealIdDetails] {
        mealDetails.meals
    }

    var firstMealId: MealIdDetails? {
        mealIdDetails.first
    }

    var mealName: String {
        firstMealId?.strMeal ?? ""
    }
    var strCategory: String {
        firstMealId?.strCategory ?? ""
    }
    var strArea: String {
        firstMealId?.strArea ?? ""
    }
    var strInstructions: String {
        firstMealId?.strInstructions ?? ""
    }
    var strMealThumb: URL? {
        URL(string: firstMealId?.strMealThumb ?? "")
    }
    var strIngredient1: String {
        firstMealId?.strIngredient1 ?? ""
    }
    var strIngredient2: String {
        firstMealId?.strIngredient2 ?? ""
    }
    var strIngredient3: String {
        firstMealId?.strIngredient3 ?? ""
    }
    var strIngredient4: String {
        firstMealId?.strIngredient4 ?? ""
    }
    var strIngredient5: String {
        firstMealId?.strIngredient5 ?? ""
    }
    var strIngredient6: String {
        firstMealId?.strIngredient6 ?? ""
    }
    var strIngredient7: String {
        firstMealId?.strIngredient7 ?? ""
    }
    var strIngredient8: String {
        firstMealId?.strIngredient8 ?? ""
    }
    var strMeasure1: String {
        firstMealId?.strMeasure1 ?? ""
    }
    var strMeasure2: String {
        firstMealId?.strMeasure2 ?? ""
    }
    var strMeasure3: String {
        firstMealId?.strMeasure3 ?? ""
    }
    var strMeasure4: String {
        firstMealId?.strMeasure4 ?? ""
    }
    var strMeasure5: String {
        firstMealId?.strMeasure5 ?? ""
    }
    var strMeasure6: String {
        firstMealId?.strMeasure6 ?? ""
    }
    var strMeasure7: String {
        firstMealId?.strMeasure7 ?? ""
    }
    var strMeasure8: String {
        firstMealId?.strMeasure8 ?? ""
    }
    var strSource: String {
        firstMealId?.strSource ?? ""
    }
    var strCreativeCommonsConfirmed: String {
        firstMealId?.strCreativeCommonsConfirmed ?? ""
    }
    var strImageSource: String {
        firstMealId?.strImageSource ?? ""
    }
}
