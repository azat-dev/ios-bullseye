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
                withAnimation {
                    isAlertOpened = false;
                }
                
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
        .cornerRadius(Constants.General.rounRectCornerRadius)
        .shadow(radius: Constants.General.rounRectCornerRadius, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var isAlertOpened = Binding.constant(true)
    static var game = Binding.constant(Game(loadTestData: true))
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
