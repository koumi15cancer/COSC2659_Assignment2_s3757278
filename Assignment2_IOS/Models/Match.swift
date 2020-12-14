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
//  Match.swift
//  Assignment2_IOS
//
//


import Foundation


import Foundation

class Match: Identifiable{
    var homeTeam: Club
    var awayTeam: Club
    var date: String
    var location: String
    var homeTeamScore: Int?
    var awayTeamScore: Int?
    
    init(homeTeam: Club, awayTeam: Club, date: String, location: String, homeTeamScore: Int?, awayTeamScore: Int?) {
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.date = date
        self.location = location
        self.homeTeamScore = homeTeamScore
        self.awayTeamScore = awayTeamScore
    }
}
