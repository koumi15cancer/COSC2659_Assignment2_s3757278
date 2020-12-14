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
//  DateManager.swift
//  Assignment2_IOS
//
//

import Foundation



//create an extension for Date to format date 
extension Date {
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}


// find matches from Date
func getMatchesBasedOnDate(date: String) -> [Match] {
    let listTimeMatch = DataHandler().listTimeMatch
    var listMatch = [Match]()
    for key in listTimeMatch.keys {
        if(key == date){
            listMatch = listTimeMatch[key]!
            break
        }
    }
    return listMatch
}

// find date in current week
func getAllDateInCurrentWeek() -> [String]{
    var listDateInCurrentWeek = [String]()
    //Create DateFormatter
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, d MMMM yyyy"
    
    let currentDate = Date()
    let calendar = Calendar.current
    let dayOfWeek = calendar.component(.weekday, from: currentDate) - 1
    let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: currentDate)!
    let days = (weekdays.lowerBound ..< weekdays.upperBound)
        .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: currentDate) }
    for day in days {
        listDateInCurrentWeek.append(dateFormatter.string(from: day))
    }
    return listDateInCurrentWeek
}

// convert UK time to our Vietnam time ( GMT + 7)
func convertUKToLocalTime(yourDate: String) -> String {
    var localTime:String = ""
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy H:mm"
    dateFormatter.timeZone = TimeZone(identifier: "Europe/London")
    if let dt = dateFormatter.date(from: yourDate) {
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "EEEE, d MMMM yyyy-H:mm"
        localTime = dateFormatter.string(from: dt)
    } else {
        print("Error decoding the string")
    }
    return localTime
}
