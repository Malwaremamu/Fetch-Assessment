//
//  ContentView.swift
//  FetchAssessment
//
//  Created by Uday Boyanapalli on 4/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var dessertListVM = DessertListViewModel()
    
    var body: some View {
        NavigationView {
            List(dessertListVM.desserts) { dessert in
                NavigationLink(destination: DessertDetailView(mealId: dessert.idMeal)) {
                    HStack {
                        URLImage(url: dessert.strMealThumb)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 100)
                            .cornerRadius(8) 
                        Text(dessert.strMeal)
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
                
            }.task {
                await dessertListVM.populateDessertData()
            }
            .navigationTitle("Desserts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
