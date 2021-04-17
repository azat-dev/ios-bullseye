//
//  ContentView.swift
//  Bullseye
//
//  Created by Azat Kaiumov on 15.04.2021.
//

import SwiftUI

struct ContentView: View {
    @State var isAlertOpened: Bool = false
    @State var currentValue: Double = 50.0
    
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text("89")
                .font(.largeTitle)
                .fontWeight(.black)
                .kerning(-1.0)
            HStack {
                Text("1")
                    .font(.body)
                    .fontWeight(.bold)
                Slider(value: self.$currentValue, in: 1.00...100.00)
                Text("2")
                    .font(.body)
                    .fontWeight(.bold)
            }
            Button(action: {
                self.isAlertOpened = true
            }) {
                Text("Hit me")
            }.alert(isPresented: $isAlertOpened, content: {
                let roundedValue = Int(self.currentValue)
               return Alert(
                    title: Text("Score"),
                message: Text("The slider's value is \(self.currentValue) rounded \(self.currentValue.rounded())"),
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
