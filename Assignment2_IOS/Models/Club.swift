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
//  Club.swift
//  Assignment2_IOS
//
//

import Foundation

import Foundation

class Club: Identifiable{
    var teamBasicInfo: TeamBasicInfo
    var matchesPlayed = 0
    var matchesWon = 0
    var matchesDrawn = 0
    var matchesLost = 0
    var goalsFor = 0
    var goalsAgainst = 0
    var lastFiveMatch: [String] = []
    var goalsDifference: Int {
        return self.goalsFor - self.goalsAgainst
    }
    var numPoints: Int {
        return (self.matchesWon * 3) + self.matchesDrawn
    }
    
    init(_ teamBasicInfo:TeamBasicInfo) {
        self.teamBasicInfo = teamBasicInfo
    }
    
    // get a string information of the Club in a row
    func getStringTeamInfo()->String{
        return "\(self.teamBasicInfo.name)".withCString{
            String(format: "%-10s %3d %3d %3d %3d %3d %3d %3d %3d", $0, self.matchesPlayed,
                   self.matchesWon,self.matchesDrawn, self.matchesLost, self.goalsFor, self.goalsAgainst, self.goalsDifference, self.numPoints)
        }
    }
    
    //generate lasts five matches as  string
    private func createLastFiveMatchStr()->String{
        var tempStr = String()
        for index in stride(from: self.lastFiveMatch.endIndex - 1, to: self.lastFiveMatch.startIndex - 1, by: -1){
            tempStr += self.lastFiveMatch[index] + " "
        }
        return tempStr
    }
    
}
