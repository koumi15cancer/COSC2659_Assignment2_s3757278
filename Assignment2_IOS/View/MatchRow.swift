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
//  MatchRow.swift
//  assignment2
//
//
//

import SwiftUI

// Match row in MatchWeekView
struct MatchRow: View {
    let match: Match
    var body: some View {
        HStack{
            Text(match.homeTeam.teamBasicInfo.name)
                .font(.system(size: 15))
                .fontWeight(.medium)
                .frame(width: 100, height: nil, alignment: .trailing)
            Image(match.homeTeam.teamBasicInfo.name)
                .resizable()
                .frame(width: 35, height: 40)
            HStack{
                if(match.homeTeamScore != nil){
                    Text(String(match.homeTeamScore!)).bold()
                    Spacer()
                    Text("-")
                    Spacer()
                    Text(String(match.awayTeamScore!)).bold()
                }else{
                    Text(convertUKToLocalTime(yourDate: match.date).components(separatedBy: "-")[1]).bold()
                }
            }.frame(width: 50, height: nil, alignment: .center)
            Image(match.awayTeam.teamBasicInfo.name)
                .resizable()
                .frame(width: 35, height: 40)
            Text(match.awayTeam.teamBasicInfo.name)
                .font(.system(size: 15))
                .fontWeight(.medium)
                .frame(width: 100, height: nil, alignment: .leading)
        }
    }
}

struct MatchRow_Previews: PreviewProvider {
    static var previews: some View {
        MatchRow(match: getListMatch()[2])
            .previewLayout(.fixed(width: 450, height: 70))
    }
}
