//
//  ContentView.swift
//  Bullseye
//
//  Created by Azat Kaiumov on 15.04.2021.
//

import SwiftUI

struct ContentView: View {
    @State var isAlertOpened = false
    @State var currentValue = 50.0
    @State var game = Game()
    
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text("\(game.target)")
                .font(.largeTitle)
                .fontWeight(.black)
                .kerning(-1.0)
            HStack {
                Text("1")
                    .font(.body)
                    .fontWeight(.bold)
                Slider(value: $currentValue, in: 1.00...100.00)
                Text("100")
                    .font(.body)
                    .fontWeight(.bold)
            }
            Button(action: {
                isAlertOpened = true
            }) {
                Text("Hit me")
            }.alert(isPresented: $isAlertOpened, content: {
                let value = currentValue.rounded()
                let earnedPoints = game.points(value: Int(value))
               
                let valueText = "The slider's value is \(value)"
                let pointsText = "You've earned \(earnedPoints)"
                
                return Alert(
                    title: Text("Score"),
                message: Text("\(valueText)\n\(pointsText)"),
                    dismissButton: .default(Text("Awesome!"))
               )
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
