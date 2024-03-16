//
//  swipe view.swift
//  PracticeUI
//
//  Created by Ishika Meel on 3/18/24.
//
//
import SwiftUI

struct swipeView: View {
    @State private var currentIndex = 0
    
    let boxes: [String] = ["Box 1", "Box 2", "Box 3"] // Sample content for the boxes
    
    var body: some View {
        VStack {
            Text(boxes[currentIndex])
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            
            HStack {
                Button(action: {
                    if self.currentIndex > 0 {
                        self.currentIndex -= 1
                    }
                }) {
                    Image(systemName: "chevron.left.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(self.currentIndex == 0 ? .gray : .blue)
                }
                
                Spacer()
                
                Button(action: {
                    if self.currentIndex < self.boxes.count - 1 {
                        self.currentIndex += 1
                    }
                }) {
                    Image(systemName: "chevron.right.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(self.currentIndex == self.boxes.count - 1 ? .gray : .blue)
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    swipeView()
}
