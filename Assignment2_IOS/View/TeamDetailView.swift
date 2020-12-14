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
//  TeamDetailView.swift
//  assignment2
//
// 

import SwiftUI

// detail of team/club
struct TeamDetailView: View {
    @Environment(\.openURL) var openURL
    var club: Club
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                VStack {
                    Image("\(club.teamBasicInfo.stadiumInfo.name)")
                        .resizable()
                        .frame(width: geo.size.width, height: 200)
                    HStack(alignment: .center){
                        Image(club.teamBasicInfo.name)
                            .resizable()
                            .frame(width: 70, height: 75)
                            .padding()
                        VStack(alignment: .leading) {
                            Text(club.teamBasicInfo.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text(club.teamBasicInfo.stadiumInfo.name)
                                .font(.title3)
                        }.padding()
                    }
                    HStack(){
                        HStack{
                            Text("Capacity:").bold()
                                .frame(width: 90, height: nil, alignment: .leading)
                            Text("\(club.teamBasicInfo.stadiumInfo.capacity)")
                        }
                        Spacer()
                    }.padding()
                    
                    HStack(){
                        HStack{
                            Text("Built:").bold()
                                .frame(width: 90, height: nil, alignment: .leading)
                            Text("\(club.teamBasicInfo.stadiumInfo.built)")
                        }
                        Spacer()
                    }.padding()
                    HStack(){
                        HStack{
                            Text("Pitch size:").bold()
                                .frame(width: 90, height: nil, alignment: .leading)
                            Text("\(club.teamBasicInfo.stadiumInfo.pitchSize)")
                        }
                        Spacer()
                    }.padding()
                    HStack(){
                        HStack(){
                            VStack {
                                Text("Address:").bold()
                                    .baselineOffset(20.0)
                                    .frame(width: 90, height: nil, alignment: .leading)
                                Spacer()
                            }
                            Text("\(club.teamBasicInfo.stadiumInfo.address)")
                        }
                        Spacer()
                    }.padding()
                    HStack(){
                        HStack(){
                            Text("Phone:").bold().frame(width: 90, height: nil, alignment: .leading)
                            Text("\(club.teamBasicInfo.contact.phone)")
                        }
                        Spacer()
                    }.padding()
                    Button(action: {
                        openURL(URL(string: "https://\(club.teamBasicInfo.contact.officialWebsite)")!)
                    }){
                        HStack(alignment: .center){
                            Spacer()
                            Text("Official Website").bold()
                                .foregroundColor(.black)
                            Spacer()
                        }.padding()
                        .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .background(Color.gray)
                    }.padding()
                    Spacer()
                }
            }
        }
    }
}

struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailView(club: getListTeam()[12])
    }
}
