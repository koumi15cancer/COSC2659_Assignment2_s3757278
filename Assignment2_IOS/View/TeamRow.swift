/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2020C
  Assessment: Assignment 2
  Author: Bui Manh Dai Duong
  ID: s3757278
  Created  date: 04/12/2020
  Last modified: 08/12/2020
  Acknowledgement: Acknowledge the resources that you use here.
*/
//  TeamRow.swift
//  assignment2
//
// 
//

import SwiftUI

// Team Row in TeamTable View
struct TeamRow: View {
    var indexTeam: Int?
    var club: Club?
    var body: some View {
        if (club == nil) {
            HStack {
                Group{
                    Text("Pos").frame(width: 40, height: nil, alignment: .center)
                    Spacer()
                    Text("Club").frame(width: 90, height: nil, alignment: .leading)
                    Spacer()
                    Text("PL").frame(width: 25, height: nil, alignment: .center)
                    Spacer()
                    Text("W").frame(width: 20, height: nil, alignment: .center)
                    Spacer()
                    Text("R").frame(width: 20, height: nil, alignment: .center)
                    Spacer()
                }
                
                Text("L").frame(width: 20, height: nil, alignment: .center)
                Spacer()
                Text("GD").frame(width: 25, height: nil, alignment: .center)
                Spacer()
                Text("Pts").frame(width: 40, height: nil, alignment: .leading)
            }
        }else{
            HStack {
                Group{
                    Text(String(indexTeam! + 1))
                        .fontWeight(.bold)
                        .frame(width: 40, height: nil, alignment: .center)
                    Spacer()
                    HStack {
                        Image(club!.teamBasicInfo.name).resizable()
                            .frame(width: 25, height: 30)
                        Text(club!.teamBasicInfo.nickName)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 60, height: nil, alignment: .leading)
                    }
                    Spacer()
                    Text(String(club!.matchesPlayed)).frame(width: 20, height: nil, alignment: .center)
                    Spacer()
                    Text(String(club!.matchesWon)).frame(width: 20, height: nil, alignment: .center)
                    Spacer()
                    Text(String(club!.matchesDrawn)).frame(width: 20, height: nil, alignment: .center)
                    Spacer()
                }
                Text(String(club!.matchesLost)).frame(width: 20, height: nil, alignment: .center)
                Spacer()
                Text(String(club!.goalsDifference)).frame(width: 25, height: nil, alignment: .center)
                Spacer()
                Text(String(club!.numPoints))
                    .fontWeight(.bold)
            }
        }
    }
}

struct TeamRow_Previews: PreviewProvider {
    static var previews: some View {
        TeamRow(indexTeam: 0, club: getListTeam()[2])
            .previewLayout(.fixed(width: 450, height: 70))
    }
}
