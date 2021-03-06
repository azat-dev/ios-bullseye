//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Azat Kaiumov on 18.04.2021.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .foregroundColor(Color("TextColor"))
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .frame(
                width: Constants.General.roundedViewLength,
                height: Constants.General.roundedViewLength
            )
            .overlay(Circle().strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth))
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(
                width: Constants.General.roundedViewLength,
                height: Constants.General.roundedViewLength
            )
            .background(
                Circle().fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .kerning(-0.2)
            .fontWeight(.bold)
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(
                        Color("ButtonStrokeColor"),
                        lineWidth: Constants.General.strokeWidth
                    )
            )
    }
}


struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "arrow.clockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundTextView(text: "62")
        }
    }
}



struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
