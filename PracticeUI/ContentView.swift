//
//  ContentView.swift
//  PracticeUI
//
//  Created by Noga Gercsak on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to GiveSync!")
                    .font(.system(size: 50))
                    .frame(alignment: .leading)
                Image("globe")
                    .resizable()
                    .scaledToFit()
                    .padding()
                NavigationLink(destination: SignInEmailView()) {
                    Text("Sign Up")
                        .padding()
                        .font(.system(size: 30))
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding([.horizontal, .bottom])
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
