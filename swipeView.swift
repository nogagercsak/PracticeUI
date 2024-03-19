//
//  swipeView.swift
//  PracticeUI
//
//  Created by Noga Gercsak on 3/18/24.
//

import SwiftUI

struct swipeView: View {
    
    private var foods: [String] = ["Cake", "Sandwich", "Apple", "Pickle", "Soup", "Cheese"].reversed()
    
    var body: some View {
        VStack{
            ZStack{
                ForEach(foods, id: \.self) { food in
                    CardView(food: food )}
            }
        }
    }
}

#Preview {
    swipeView()
}
