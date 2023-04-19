//
//  Webservice.swift
//  FetchAssessment
//
//  Created by Uday Boyanapalli on 4/18/23.
//

import Foundation

enum DessertError: Error {
    case invalidServiceResponse
}

enum MealError: Error {
    case invalidServiceResponse
}

class Webservice {
    
    func getDessert() async throws -> Dessert {
        let (data, response) = try await URLSession.shared.data(from: Constants.Urls.allDesserts)
        guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
                throw DessertError.invalidServiceResponse
            }
        return try JSONDecoder().decode(Dessert.self, from: data)
    }
    
    func getMealDetails(_ mealId: String) async throws -> MealDetails {
        let (data, response) = try await URLSession.shared.data(from: URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)")!)
        guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
                throw MealError.invalidServiceResponse
            }
        return try JSONDecoder().decode(MealDetails.self, from: data)
    }

}

