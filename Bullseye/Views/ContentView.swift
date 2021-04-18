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
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack {
                Text("🎯🎯🎯\nPut the Bullsyee as close as you can".uppercased())
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                    .foregroundColor(Color("TextColor"))
                
                Text("\(game.target)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .kerning(-1.0)
                    .foregroundColor(Color("TextColor"))
                
                HStack {
                    Text("1")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                    
                    Slider(value: $currentValue, in: 1.00...100.00)
                    
                    Text("100")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                }
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

                .alert(isPresented: $isAlertOpened, content: {
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
            }.padding(20.0)
        }
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
