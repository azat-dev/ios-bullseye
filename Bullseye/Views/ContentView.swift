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
    @State var game = Game(loadTestData: false)
    
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game, sliderValue:  $sliderValue)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, isAlertOpened ? 0 : 100.0)
                    .transition(.scale)
                
                if isAlertOpened {
                    PointsView(
                        isAlertOpened: $isAlertOpened,
                        game: $game,
                        sliderValue: $sliderValue
                    )
                    .transition(.scale)
                } else {
                    HitmeButton(isAlertOpened: $isAlertOpened, game: $game, currentValue: $sliderValue)
                        .padding(20.0)
                        .transition(.scale)
                }

            }
            
            if !isAlertOpened {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
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
            withAnimation {
                isAlertOpened = true
            }
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
        .cornerRadius(Constants.General.rounRectCornerRadius)
        .overlay(RoundedRectangle(cornerRadius: Constants.General.rounRectCornerRadius)
                    .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth))
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
