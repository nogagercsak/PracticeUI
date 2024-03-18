//
//  UserInputView.swift
//  PracticeUI
//
//  Created by Noga Gercsak on 3/16/24.
//

import SwiftUI

struct UserInputView: View {
    @State private var name: String = ""
    @State private var dob: Date = Date()
    @State private var zipCode: String = ""
    @State private var openToRemote: Bool = false
    @State private var selectedInterests: Set<String> = []
    
    let interests = [
        "Technology", "Art", "Cooking", "Photography", "Travel",
        "Fitness", "Music", "Reading", "Gaming", "Fashion",
        "Sports", "Coding", "Writing", "Dancing", "Movies"
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter your info:")) {
                    TextField("Name", text: $name)
                    
                    DatePicker("Date of Birth", selection: $dob, displayedComponents: .date)
                    
                    TextField("Zip Code", text: $zipCode)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Interests")) {
                    ForEach(interests, id: \.self) { interest in
                        Button(action: {
                            toggleInterest(interest)
                        }) {
                            Text(interest)
                                .foregroundColor(selectedInterests.contains(interest) ? .white : .primary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(selectedInterests.contains(interest) ? Color.blue : Color.clear)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(selectedInterests.contains(interest) ? Color.blue : Color.gray, lineWidth: 1)
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                
                Section(header: Text("Preferences")) {
                    Toggle("Open to Remote Opportunities", isOn: $openToRemote)
                }
            }
            .navigationBarTitle("Info 📊")
            .navigationBarItems(trailing: Button("Save", action: saveButtonTapped))
        }
    }
    
    func saveButtonTapped() {
        // Implement saving logic here
        print("Name: \(name)")
        print("Date of Birth: \(dob)")
        print("Zip Code: \(zipCode)")
        print("Open to Remote: \(openToRemote)")
        print("Selected Interests: \(selectedInterests)")
    }
    
    func toggleInterest(_ interest: String) {
        if selectedInterests.contains(interest) {
            selectedInterests.remove(interest)
        } else {
            if selectedInterests.count < 5 {
                selectedInterests.insert(interest)
            } else {
                // Show an alert or message that only 5 interests can be selected
                print("Only 5 interests can be selected.")
            }
        }
    }
}

struct UserInputView_Previews: PreviewProvider {
    static var previews: some View {
        UserInputView()
    }
}
