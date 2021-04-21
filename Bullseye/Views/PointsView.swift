//
//  PointsView.swift
//  Bullseye
//
//  Created by Azat Kaiumov on 21.04.2021.
//

import SwiftUI

struct PointsView: View {
    @Binding var isAlertOpened: Bool
    @Binding var game: Game
    @Binding var sliderValue: Double
    
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(value: roundedValue)
        
        VStack(spacing: 10) {
            InstructionText(text: "The slider value is".uppercased())
            BigNumberText(text: String(roundedValue))
            BodyTextView(points: points)
            Button(action: {
                isAlertOpened = false;
                game.startNewRound(points: points)
                sliderValue = 50
            }, label: {
                ButtonTextView()
            })
        }
        .padding(.top, 32.0)
        .padding(.bottom, 20.0)
        .padding(.leading, 20.0)
        .padding(.trailing, 20.0)
        .frame(maxWidth: 315)
        .background(Color("BackgroundColor"))
        .cornerRadius(21.0)
        .shadow(radius: 21, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var isAlertOpened = Binding.constant(false)
    static var game = Binding.constant(Game())
    static var sliderValue = Binding.constant(50.0)
    
    static var previews: some View {
        PointsView(
            isAlertOpened: isAlertOpened,
            game: game,
            sliderValue: sliderValue
        )
        PointsView(
            isAlertOpened: isAlertOpened,
            game: game,
            sliderValue: sliderValue
        )
        .previewLayout(.fixed(width: 568, height: 320))
        
        
        PointsView(
            isAlertOpened: isAlertOpened,
            game: game,
            sliderValue: sliderValue
        )
        .preferredColorScheme(.dark)
        PointsView(
            isAlertOpened: isAlertOpened,
            game: game,
            sliderValue: sliderValue
        )
        .previewLayout(.fixed(width: 568, height: 320))
        .preferredColorScheme(.dark)
    }
}
