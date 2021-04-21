//
//  ContentView.swift
//  Bullseye
//
//  Created by Azat Kaiumov on 15.04.2021.
//

import SwiftUI

struct ContentView: View {
    @State var isAlertOpened = false
    @State var sliderValue = 50.0
    @State var game = Game()
    
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game, sliderValue:  $sliderValue)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, isAlertOpened ? 0 : 100.0)
                
                if isAlertOpened {
                    PointsView(
                        isAlertOpened: $isAlertOpened,
                        game: $game,
                        sliderValue: $sliderValue
                    )
                } else {
                    HitmeButton(isAlertOpened: $isAlertOpened, game: $game, currentValue: $sliderValue)
                        .padding(20.0)
                }

            }
            
            if !isAlertOpened {
                SliderView(sliderValue: $sliderValue)
            }
            
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct HitmeButton: View {
    @Binding var isAlertOpened: Bool
    @Binding var game: Game
    @Binding var currentValue: Double
    
    var body: some View {
        Button(action: {
            isAlertOpened = true
        }) {
            Text("hit me".uppercased())
                .fontWeight(.bold)
                .font(.title3)
                .foregroundColor(Color.white)
        }
        .padding(20)
        .background(ZStack {
            Color("ButtonColor")
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color(
                            red: 1,
                            green: 1,
                            blue: 1,
                            opacity: 0.3
                        ),
                        Color.clear
                    ]),
                startPoint: .top,
                endPoint: .bottom
            )
        })
        .cornerRadius(21.0)
        .overlay(RoundedRectangle(cornerRadius: 21).strokeBorder(Color.white, lineWidth: 2.0))
        .alert(isPresented: $isAlertOpened, content: {
            let value = currentValue.rounded()
            let earnedPoints = game.points(value: Int(value))
            
            
            let valueText = "The slider's value is \(value)"
            let pointsText = "You've earned \(earnedPoints)"
            
            return Alert(
                title: Text("Score"),
                message: Text("\(valueText)\n\(pointsText)"),
                dismissButton: .default(Text("Awesome!")) {
                    game.startNewRound(points: earnedPoints)
                }
            )
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
        
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView().previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
