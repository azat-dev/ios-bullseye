//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Azat Kaiumov on 18.04.2021.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView()
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
    }
}


struct TopView: View {
    var body: some View {
        HStack {
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            Spacer()
            RoundedImageViewStroked(systemName: "list.dash")
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
            Text(title.uppercased())
                .font(.caption2)
                .fontWeight(.bold)
                .kerning(1.5)
                .foregroundColor(Color("TextColor"))
            
            Text(text)
                .font(.title3)
                .fontWeight(.bold)
                .frame(width: 68.0, height: 56.0)
                .foregroundColor(Color("TextColor"))
                .background(
                    RoundedRectangle(cornerRadius: 21.0)
                        .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
                )
        }
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
