//
//  InterestSelectionView.swift
//  PracticeUI
//
//  Created by Noga Gercsak on 3/16/24.
//

import SwiftUI

struct InterestSelectionView: View {
    let interests = [
        "Technology", "Art", "Cooking", "Photography", "Travel",
        "Fitness", "Music", "Reading", "Gaming", "Fashion",
        "Sports", "Coding", "Writing", "Dancing", "Movies"
    ]
    
    @State private var selectedInterests: Set<String> = []
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select Interests")) {
                    ForEach(interests, id: \.self) { interest in
                        Button(action: {
                            toggleInterest(interest)
                        }) {
                            HStack {
                                Text(interest)
                                    .foregroundColor(selectedInterests.contains(interest) ? .white : .primary)
                                    .padding()
                                    .background(selectedInterests.contains(interest) ? Color.blue : Color.clear)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(selectedInterests.contains(interest) ? Color.blue : Color.gray, lineWidth: 1)
                                    )
                                Spacer()
                                if selectedInterests.contains(interest) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationBarTitle("Interests")
        }
    }
    
    func toggleInterest(_ interest: String) {
        if selectedInterests.contains(interest) {
            selectedInterests.remove(interest)
        } else {
            if selectedInterests.count < 5 {
                selectedInterests.insert(interest)
            } else {
                // Optionally provide an alert or feedback to the user
                print("You can only select up to 5 interests.")
            }
        }
    }
}

struct InterestSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        InterestSelectionView()
    }
}

