//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Azat Kaiumov on 24.04.2021.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                HeaderView()
                LabelsView()
                RowView(
                    index: 1,
                    playerName: "Mike",
                    score: 459,
                    date: Date()
                )
            }
        }
        
    }
}

struct LabelsView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            //            LabelTextView(text: "player".uppercased())
            //            Spacer()
            LabelTextView(text: "score".uppercased())
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelTextView(text: "date".uppercased())
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(0)
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                HStack {
                    BigBoldText(text: "Leaderboard".uppercased())
                        .padding(.trailing)
                    
                    RoundedImageViewFilled(systemName: "xmark")
                }
            } else {
                BigBoldText(text: "Leaderboard".uppercased())
                HStack {
                    Spacer()
                    RoundedImageViewFilled(systemName: "xmark")
                }.padding(.trailing)
            }
            
            
        }
    }
}

struct PlayerNameTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
            .fontWeight(.bold)
            .kerning(-0.5)
    }
}

struct ScoreTextView: View {
    var value: Int
    
    var body: some View {
        Text(String(value))
            .foregroundColor(Color("TextColor"))
            .font(.title3)
            .fontWeight(.bold)
            .kerning(-0.5)
    }
}

struct DateTextView: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
            .fontWeight(.bold)
            .kerning(-0.5)
    }
}

struct RowView: View {
    let index: Int
    let playerName: String
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundTextView(text: String(index))
            Spacer()
            //            PlayerNameTextView(text: playerName)
            //            Spacer()
            ScoreTextView(value: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateTextView(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(0)
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(
                    Color("BackgroundRingColor"),
                    lineWidth: Constants.General.strokeWidth
                )
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
        
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
        
        LeaderboardView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
