//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Azat Kaiumov on 24.04.2021.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var game: Game
    @Binding var leaderboardIsShowing: Bool
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                    .padding(.top)
                LabelsView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices) { index in
                            RowView(
                                position: index + 1,
                                score: game.leaderboardEntries[index].score,
                                date: game.leaderboardEntries[index].date
                            )
                            
                        }
                    }
                }
            }.padding(.bottom)
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
    @Binding var leaderboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                HStack {
                    BigBoldText(text: "Leaderboard".uppercased())
                        .padding(.trailing)
                    
                    Button(action: {
                        leaderboardIsShowing = false
                    }) {
                        RoundedImageViewFilled(systemName: "xmark")
                    }
                }
            } else {
                BigBoldText(text: "Leaderboard".uppercased())
                HStack {
                    Spacer()
                    Button(action: {
                        leaderboardIsShowing = false
                    }) {
                        RoundedImageViewFilled(systemName: "xmark")
                    }
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
    let position: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundTextView(text: String(position))
            Spacer()
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
    private static var leaderboardIsShowing = Binding.constant(false)
    private static var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderboardView(
            game: game,
            leaderboardIsShowing: leaderboardIsShowing
        )
        
        LeaderboardView(
            game: game,
            leaderboardIsShowing: leaderboardIsShowing
        )
        .previewLayout(.fixed(width: 568, height: 320))
    }
}
