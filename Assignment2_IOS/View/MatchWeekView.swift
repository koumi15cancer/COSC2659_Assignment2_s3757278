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
//  MatchWeekView.swift
//  assignment2
//
//  

import SwiftUI

// Match of current week
struct MatchWeekView: View {
    let listTimeMatchAvailableInCurrentWeek = DataHandler().listTimeMatchAvailableInCurrentWeek
    var body: some View {
        NavigationView {
            List{
                ForEach(listTimeMatchAvailableInCurrentWeek, id: \.self){ date in
                    Section(header: Text(date), content:{
                        ForEach(getMatchesBasedOnDate(date: date)){match in
                            MatchRow(match: match)
                        }
                    })
                }
            }.navigationBarTitle("Match Week", displayMode: .inline)
            .listStyle(GroupedListStyle())
        }.ignoresSafeArea(.all)
    }
}

struct MatchWeekView_Previews: PreviewProvider {
    static var previews: some View {
        MatchWeekView()
    }
}
