//
//  DessertDetailView.swift
//  FetchAssessment
//
//  Created by Uday Boyanapalli on 4/18/23.
//

import SwiftUI

struct DessertDetailView: View {
    
    @StateObject private var mealByIdVM = MealDetailViewModel()
    
    var mealId: String
    
    var body: some View {
        List(mealByIdVM.mealDetails) { mealDetail in
            HStack(alignment: .top, spacing: 5) {
                URLImage(url: mealDetail.strMealThumb)
                    .scaledToFit()
                    .frame(width: 500, height: 500, alignment: .center)
                    .padding(.vertical, 20)
                    .cornerRadius(8)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("Meal Name: \(mealDetail.mealName)")
                Text("Meal Area: \(mealDetail.strArea)")
                Text("Meal Area: \(mealDetail.strCategory)")
                Text("Ingredients: ")
                Text(" \(mealDetail.strIngredient1) - \(mealDetail.strMeasure1)")
                Text(" \(mealDetail.strIngredient2) - \(mealDetail.strMeasure2)")
                Text(" \(mealDetail.strIngredient3) - \(mealDetail.strMeasure3)")
                Text(" \(mealDetail.strIngredient4) - \(mealDetail.strMeasure4)")
                Text(" \(mealDetail.strIngredient5) - \(mealDetail.strMeasure5)")
                Text(" \(mealDetail.strIngredient6) - \(mealDetail.strMeasure6)")
                
            }
            .font(.title2)
            .fontWeight(.bold)
            
        }
        .task {
            await mealByIdVM.populateMealDetails(mealId)
        }
    }
}

struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailView(mealId: "53049")
            .previewDevice("iPhone 13")
    }
}
