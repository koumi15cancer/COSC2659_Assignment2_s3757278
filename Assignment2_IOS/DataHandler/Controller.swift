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
//  Controller.swift
//  Assignment2_IOS
//
//

import Foundation

//get data from basicTeamData.json
let basicTeamData = DataHandler().teamBasicInfo

//get data from basicTeamData.json
let matchInfo = DataHandler().matchInfo

//get listTeam from DataHandler
let listTeam = DataHandler().listTeam



func getListTeam() -> [Club]{
    //update match information to each team
    updateInfoToTeams(listMatch: getListMatch())
    
    //sort list team based on team points
    let sortedListTeam = listTeam.sorted(by: {(team1,team2)->Bool in
        return team1.numPoints > team2.numPoints
    })
    
    return sortedListTeam
}
func getListMatch() -> [Match]{
    //Create and return a list match
    return createInfoToMatchList(matchInfoList: matchInfo, listTeam: listTeam)
}
