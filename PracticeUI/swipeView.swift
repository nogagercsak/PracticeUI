//
//  swipe view.swift
//  PracticeUI
//
//  Created by Ishika Meel on 3/18/24.
//
//

import SwiftUI

struct Card: View {
    var content: String

        VStack {
            Text(content)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
        }
        .offset(offset)
        .gesture(
            DragGesture()
                .onChanged { value in
                    self.offset = value.translation // Modify offset with @State
                }
                .onEnded { value in
                    withAnimation {
                        if abs(self.offset.width) > 100 {
                            self.onRemove()
                        } else {
                            self.offset = .zero
                        }
                    }
                }
        )
    }
}

struct SwipeStack: View {
    @State private var cards: [String] = ["Card 1", "Card 2", "Card 3"]
    
    var body: some View {
        ZStack {
            ForEach(cards.indices.reversed(), id: \.self) { index in
                Card(content: self.cards[index], onRemove: {
                    self.removeCard(at: index)
                })
                .offset(x: 0, y: CGFloat(index) * 20) // Stacking effect
            }
        }
    }
    
    private func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}

struct SwipeStack_Previews: PreviewProvider {
    static var previews: some View {
        SwipeStack()
    }
}
