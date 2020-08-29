//
//  ContentView.swift
//  KTsLoveAlarm
//
//  Created by KT Chen on 8/28/20.
//  Copyright © 2020 KT Chen. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    //Should use some data struct to keep record of "isToggles"
    @State private var isToggle1 = true
    @State private var isToggle2 = true
    @State private var addMode = false
    @State private var showAlert = true
    let Color1 = Color(red: 0.2, green: 0.6, blue: 0.5, opacity: 1)
    
    var body: some View {
        NavigationView {
            VStack{
                //Here are the alarms
                Form{
                    //Add a for loop here to show all the alarms
                    Toggle(isOn: $isToggle1){
                        HStack(spacing: 20){
                            Image("Pic1").resizable()
                                .frame(width: 75, height: 75)
                                .clipShape(Circle())
                            VStack(alignment: .leading){
                                Text("14个月快乐").font(.custom("Wawati", size: 25))
                                Text("2020/08/28"+" 08:40am")
                            }
                        }
                    }
                    .padding(12)
                        
                    Toggle(isOn: $isToggle2){
                        HStack(spacing: 20){
                            Image("Pic2").resizable()
                                .frame(width: 75, height: 75)
                                .clipShape(Circle())
                            VStack(alignment: .leading){
                                Text("起床啦大叔～").font(.custom("Wawati", size: 25))
                                Text("2020/08/28"+" 12:00pm")
                            }
                        }
                    }
                    .padding(12)
                }
                
                
                //the buttons at the bottom
                HStack (spacing: 50){
                    Button(action: {
                        print("Alarmlist button was tapped")
                    }) {
                        Image(systemName: "alarm").resizable()
                            .frame(width: 30, height: 30)
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(5)
                            //.shadow(color: .black, radius: 2)
                            .padding(8)
                    }
                    
                    Button(action: {
                        print("Friends button was tapped")
                    }) {
                        Image(systemName: "person.3").resizable()
                            .frame(width: 55, height: 30)
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(5)
                            //.shadow(color: .black, radius: 2)
                            .padding(8)
                    }
                    
                    Button(action: {
                        print("Home button was tapped")
                    }) {
                        Image(systemName: "person").resizable()
                            .frame(width: 30, height: 28)
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(5)
                            //.shadow(color: .black, radius: 2)
                            .padding(8)
                    }
                }
            }
            .navigationBarTitle("My Alarms")
                
            //the plus button in the navigation bar
            .navigationBarItems(trailing: Button(action: {
             // button activates link
              self.addMode = true
            }) {
            Image(systemName: "plus")
                .resizable()
                .padding(6)
                .frame(width: 24, height: 24)
                .background(Color(red: 1, green: 0.8, blue: 0, opacity: 0.8))
                .clipShape(Circle())
                .foregroundColor(.blue)
            })
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Remainder"), message: Text("To receive others' alarms in time, please turn on sound."), dismissButton: .default(Text("Got it")) {
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
