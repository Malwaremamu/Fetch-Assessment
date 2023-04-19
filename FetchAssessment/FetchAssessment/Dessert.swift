//
//  Dessert.swift
//  FetchAssessment
//
//  Created by Uday Boyanapalli on 4/18/23.
//

import Foundation

//Dessert Codable
struct Dessert: Codable {
    let meals: [Meal]
    
}
struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

