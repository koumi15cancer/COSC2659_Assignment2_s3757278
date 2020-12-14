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
//  TeamTableView.swift
//  assignment2
//
//  

import SwiftUI

// team table view
struct TeamTableView: View {
    let listTeams = getListTeam()
    var body: some View {
        NavigationView {
            List{
                Section(header: TeamRow(indexTeam: nil, club: nil)){
                    ForEach(listTeams){club in
                        NavigationLink(destination: TeamDetailView(club: club)) {
                            TeamRow(indexTeam: listTeams.firstIndex(where: {$0 === club}), club: club)
                        }
                    }
                }
            }.navigationBarTitle("Team Table")
            .listStyle(GroupedListStyle())
        }
    }
}

struct TeamTableView_Previews: PreviewProvider {
    static var previews: some View {
        TeamTableView()
    }
}
