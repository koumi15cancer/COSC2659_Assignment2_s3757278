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
//  FileManager.swift
//  Assignment2_IOS
//
//

import Foundation





//read file function
func readFile(nameURL: String, typeFile: String)-> [String]?{
    //Read csv and clean data and put valid data in eplData variable
    if let path = Bundle.main.url(forResource: nameURL, withExtension: typeFile) {
        do {
            let data = try String(contentsOf: path, encoding: .utf8)
            return data.components(separatedBy: .newlines)
        } catch {
            print("Read file error!!!")
            return nil
        }
    }else{
        return nil
    }
}

//provide match data to match list and return
func createInfoToMatchList(matchInfoList: [MatchInfo], listTeam: [Club])-> [Match]{
    var matchList: [Match] = []
    var homeTeamScore,awayTeamScore: Int?
    var homeTeam, awayTeam: Club
    for match in matchInfoList{
        //get home team and away team
        homeTeam = listTeam.first(where: {$0.teamBasicInfo.name == match.homeTeam})!
        awayTeam = listTeam.first(where: {$0.teamBasicInfo.name == match.awayTeam})!
        //get score for home team and away team
        if(match.result != ""){
                  let arrayScore =  match.result!.components(separatedBy: " - ")
                  homeTeamScore = Int(arrayScore[0])
                  awayTeamScore = Int(arrayScore[1])
        }else{
            homeTeamScore = nil
            awayTeamScore = nil
        }
        //add new match to match list
        matchList.append(Match(homeTeam: homeTeam, awayTeam: awayTeam, date: match.date, location: match.location, homeTeamScore: homeTeamScore, awayTeamScore: awayTeamScore))
    }
    return matchList
}


// update to club if won
internal func updateWinResult(team: Club){
        team.matchesWon += 1
        if(team.lastFiveMatch.count >= 5){
            team.lastFiveMatch.remove(at: 0);
            team.lastFiveMatch.append("\u{2705}")
        }else{
            team.lastFiveMatch.append("\u{2705}")
        }
    }
    
// update to club if Lost
internal func updateLostResult(team: Club){
        team.matchesLost += 1
        if(team.lastFiveMatch.count >= 5){
            team.lastFiveMatch.remove(at: 0);
            team.lastFiveMatch.append("\u{274C}")
        }else{
            team.lastFiveMatch.append("\u{274C}")
        }
    }
    
// update to club if drawn
 internal func updateDrawnResult(team: Club){
        team.matchesDrawn += 1
        if(team.lastFiveMatch.count >= 5){
            team.lastFiveMatch.remove(at: 0);
            team.lastFiveMatch.append("\u{2796}")
        }else{
            team.lastFiveMatch.append("\u{2796}")
        }
    }


//provide team data from list match
func updateInfoToTeams( listMatch: [Match]){
    let listComplMatch = listMatch.filter({$0.awayTeamScore != nil})
    for match in listComplMatch{
        let homeTeam = match.homeTeam
        let awayTeam = match.awayTeam
        
        // variable score for both team
        let scoreHomeTeam = match.homeTeamScore
        let scoreAwayTeam = match.awayTeamScore
        
        //update match played for both team
        homeTeam.matchesPlayed += 1
        awayTeam.matchesPlayed += 1
        
        //update goalsFor and goalsAgainst
        homeTeam.goalsFor += scoreHomeTeam!
        homeTeam.goalsAgainst += scoreAwayTeam!
        
        awayTeam.goalsFor += scoreAwayTeam!
        awayTeam.goalsAgainst += scoreHomeTeam!
        
        //update matchesWon, matchesDrawn, matchesLost and Las Five Matches for each team
        if( scoreHomeTeam! > scoreAwayTeam!){
                 updateWinResult(team: homeTeam)
                 updateLostResult(team: awayTeam)
                }else if(scoreHomeTeam! < scoreAwayTeam!){
                 updateWinResult(team: awayTeam)
                 updateLostResult(team: homeTeam)
                }else{
                 updateDrawnResult(team: homeTeam)
                 updateDrawnResult(team: awayTeam)
            }
        }
    }



