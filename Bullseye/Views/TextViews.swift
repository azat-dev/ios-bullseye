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
            .bold()
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
        InstructionText(text: "🎯🎯🎯\nPut the Bullsyee as close as you can")
            .padding(.leading, 30.0)
            .padding(.trailing, 30.0)
        
        BigNumberText(text: "\(game.target)")
    }
}

struct SliderLabel: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
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


struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instruction")
            BigNumberText(text: "77")
            SliderLabel(text: "100")
        }
    }
}
