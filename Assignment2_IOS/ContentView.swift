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
//  ContentView.swift
//  Assignment2_IOS
//
//

import SwiftUI
import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView{
            MatchWeekView().tabItem { Text("Match Week") }.tag(1)
            TeamTableView().tabItem { Text("List Team") }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8", "iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
