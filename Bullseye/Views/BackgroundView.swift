//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Azat Kaiumov on 18.04.2021.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @State var leaderboardIsShowing = false
    
    var body: some View {
        VStack {
            TopView(
                game: $game,
                sliderValue: $sliderValue,
                leaderboardIsShowing: $leaderboardIsShowing
            )
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(RingsView())
        .sheet(isPresented: $leaderboardIsShowing, content: {
            LeaderboardView(
                game: $game,
                leaderboardIsShowing: $leaderboardIsShowing
            )
        })
    }
}


struct TopView: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var leaderboardIsShowing: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                game.restart()
                sliderValue = 50.0
                
            }) {
                RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button(action:  {
                leaderboardIsShowing.toggle()
            }) {
                RoundedImageViewStroked(systemName: "list.dash")
            }
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5.0) {
            NumberViewLabel(text: title)
            RoundedTextView(text: text)
        }
    }
}

struct NumberViewLabel: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .font(.caption2)
            .fontWeight(.bold)
            .kerning(1.5)
            .foregroundColor(Color("TextColor"))
    }
}

struct RoundedTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title3)
            .kerning(-0.2)
            .fontWeight(.bold)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .foregroundColor(Color("TextColor"))
            .background(
                RoundedRectangle(cornerRadius: Constants.General.rounRectCornerRadius)
                    .strokeBorder(
                        Color("ButtonStrokeColor"),
                        lineWidth: Constants.General.strokeWidth
                    )
            )
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            
            ForEach(1..<6) { ring in
                let size = CGFloat(100 * ring)
                let opacity = (colorScheme == .dark) ? 0.1 : 0.3
                
                Circle()
                    .strokeBorder(
                        RadialGradient(gradient: Gradient(
                            colors: [
                                Color("BackgroundRingColor").opacity(opacity),
                                Color("BackgroundRingColor").opacity(0)
                            ]
                        ),
                        center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                        startRadius: 100,
                        endRadius: 300
                        ),
                        lineWidth: 20.0)
                    .frame(width: size, height: size)
                
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game(loadTestData: true)), sliderValue: .constant(50.0))
        BackgroundView(game: .constant(Game(loadTestData: true)), sliderValue: .constant(50.0)).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        
        VStack(spacing: 10) {
            NumberViewLabel(text: "Label")
            RoundedTextView(text: "100")
            NumberView(title: "score", text: "999")
        }
    }
}
