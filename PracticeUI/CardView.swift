//
//  CardView.swift
//  PracticeUI
//
//  Created by Noga Gercsak on 3/18/24.
//

import SwiftUI

struct CardView: View {
    
    var food: String
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 320, height: 420)
                .border(.white, width: 6.0)
                .cornerRadius(40)
                .foregroundColor(color) // Apply color here
            HStack{
                Text(food)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
        DragGesture()
            .onChanged{ gesture in
                offset = gesture.translation
                withAnimation{
                    changeColor(width: offset.width)
                }
            } .onEnded{_ in
                withAnimation(){
                    swipeCard(width: offset.width)
                    changeColor(width: offset.width)
                }
            }
        )
    }
    
    func swipeCard(width: CGFloat){
        switch width {
        case -500...(-150):
            print("\(food) removed")
            offset = CGSize(width: -500, height: 0)
        case 150...500:
            print("\(food) added")
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
    
    func changeColor(width: CGFloat) {
        if width < -130 {
            color = .red
        } else if width > 130 {
            color = .green
        } else {
            color = .black
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(food: "Cake")
    }
}

