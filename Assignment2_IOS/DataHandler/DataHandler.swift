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
//  DataHandler.swift
//  Assignment2_IOS
//
//


import Foundation


// MatchInfo data
struct MatchInfo: Codable, Hashable{
    var roundNumber: Int
    var date: String
    var location: String
    var homeTeam: String
    var awayTeam: String
    var result: String?
}

// TeamInfo data
struct TeamBasicInfo: Codable, Hashable{
    var name: String
    var fullName: String
    var nickName: String
    var stadiumInfo: StadiumInfo
    var contact:  Contact
    
}

// StadiumInfo data
struct StadiumInfo: Codable,Hashable{
    var name: String
    var capacity: Int
    var built: String
    var pitchSize: String
    var address: String
}

// Contact data
struct Contact: Codable, Hashable{
    var phone: String
    var officialWebsite: String
}

public class DataHandler{
    @Published var teamBasicInfo = [TeamBasicInfo]()
    @Published var matchInfo = [MatchInfo]()
    @Published var listTeam = [Club]()
    @Published var listTimeMatch = [String:[Match]]()
    @Published var listTimeMatchAvailableInCurrentWeek = [String]()
    
    init() {
        loadTeamBasicInfo()
        loadMatchInfo()
        fillBasicTeamData()
        loadListTimeMatch()
        loadListTimeMatchInCurrentWeek()
    }
    
    //
    func loadListTimeMatchInCurrentWeek() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, d MMMM yyyy"
        dateFormatter.timeZone = TimeZone.current
        let allDateInCurrentWeek = getAllDateInCurrentWeek()
        self.listTimeMatchAvailableInCurrentWeek = Array(listTimeMatch.filter({allDateInCurrentWeek.contains($0.key)}).keys).sorted(by: {(date1,date2)->Bool in
            return dateFormatter.date(from: date1)!.compare(dateFormatter.date(from: date2)!) == .orderedAscending
        })
    }
    
    // get match of current date
    func loadListTimeMatch(){
        for match in createInfoToMatchList(matchInfoList: self.matchInfo, listTeam: self.listTeam) {
            let currentTime = convertUKToLocalTime(yourDate: match.date).components(separatedBy: "-")[0]
            if(self.listTimeMatch.contains(where: {$0.key == currentTime})){
                listTimeMatch[currentTime]?.append(match)
            }else{
                listTimeMatch[currentTime] = [match]
            }
        }
    }
    
    // get teamInfo to each Club
    func fillBasicTeamData() {
        for team in self.teamBasicInfo{
            self.listTeam.append(Club(team))
        }
    }
    
    // read teamInfo from json file
    func loadTeamBasicInfo() {
        if let url = Bundle.main.url(forResource: "basicTeamData", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([TeamBasicInfo].self, from: data)
                self.teamBasicInfo = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    // read MatchesInfo from json file
    func loadMatchInfo() {
        if let url = Bundle.main.url(forResource: "MatchesInfo", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([MatchInfo].self, from: data)
                self.matchInfo = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}


//create an extension for Array to remove duplicate elements
extension Array where Element: Hashable{
    func removingDuplicatEle() -> [Element] {
        var tmpDict = [Element:Bool]()
        
        return filter{
            tmpDict.updateValue(true, forKey: $0) == nil
        }
    }
    mutating func removeDuplicateEle(){
        self = self.removingDuplicatEle()
    }
}
