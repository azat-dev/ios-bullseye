//
//  TextViews.swift
//  Bullseye
//
//  Created by Azat Kaiumov on 18.04.2021.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .fontWeight(.bold)
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.black)
            .kerning(-1.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the Bullsyee as close as you can")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            
            BigNumberText(text: "\(game.target)")
                .transition(.scale)
        }
    }
}

struct SliderLabel: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabel(text: "1")
            Slider(value: $sliderValue, in: 1.00...100.00)
            SliderLabel(text: "100")
        }
    }
}

struct ButtonTextView: View {
    var body: some View {
        Text("Start New Round")
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("AccentColor"))
            .cornerRadius(12.0)
    }
}

struct BodyTextView: View {
    var points: Int
    var body: some View {
        Text("You scored \(points)\n🎉🎉🎉")
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(Color("TextColor"))
            .multilineTextAlignment(.center)
            .lineSpacing(15)
        
    }
}


struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instruction")
            BigNumberText(text: "77")
            SliderLabel(text: "100")
            BodyTextView(points: 100)
            ButtonTextView()
        }.frame(width: .infinity)
    }
}
