//
//  HomeView.swift
//  LoveAlarm
//
//  Created by Xinda on 8/26/20.
//  Copyright © 2020 Xinda Zhou. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
//
//    @State private var isToggle1 = true
//    @State private var isToggle2 = true
//    @State private var addMode = false
//    @State private var showAlert = true
    
    @State private var showAddAlarm = false;
    
    var body: some View {
        MyAlarmsView(showAddAlarm: $showAddAlarm)
            .sheet(isPresented: $showAddAlarm) {
                AddAlarmView().environmentObject(self.userInfo)
        }
        
        
//        NavigationView {
//            VStack{
//                Text("Logged in as \(userInfo.user.name)")
//                //Here are the alarms
//                Form{
//                    //Add a for loop here to show all the alarms
//                    Toggle(isOn: $isToggle1){
//                        HStack(spacing: 20){
//                            Image("Pic1").resizable()
//                                .frame(width: 75, height: 75)
//                                .clipShape(Circle())
//                            VStack(alignment: .leading){
//                                Text("14个月快乐").font(.custom("Wawati", size: 25))
//                                Text("2020/08/28"+" 08:40am")
//                            }
//                        }
//                    }
//                    .padding(12)
//
//                    Toggle(isOn: $isToggle2){
//                        HStack(spacing: 20){
//                            Image("Pic2").resizable()
//                                .frame(width: 75, height: 75)
//                                .clipShape(Circle())
//                            VStack(alignment: .leading){
//                                Text("起床啦大叔～").font(.custom("Wawati", size: 25))
//                                Text("2020/08/28"+" 12:00pm")
//                            }
//                        }
//                    }
//                    .padding(12)
//                }
//
//
//                //the buttons at the bottom
//                HStack (spacing: 50){
//                    Button(action: {
//                        print("Alarmlist button was tapped")
//                    }) {
//                        Image(systemName: "alarm").resizable()
//                            .frame(width: 30, height: 30)
//                            .background(Color(UIColor.systemBackground))
//                            .cornerRadius(5)
//                            //.shadow(color: .black, radius: 2)
//                            .padding(8)
//                    }
//
//                    Button(action: {
//                        print("Friends button was tapped")
//                    }) {
//                        Image(systemName: "person.3").resizable()
//                            .frame(width: 55, height: 30)
//                            .background(Color(UIColor.systemBackground))
//                            .cornerRadius(5)
//                            //.shadow(color: .black, radius: 2)
//                            .padding(8)
//                    }
//
//                    Button(action: {
//                        print("Home button was tapped")
//                    }) {
//                        Image(systemName: "person").resizable()
//                            .frame(width: 30, height: 28)
//                            .background(Color(UIColor.systemBackground))
//                            .cornerRadius(5)
//                            //.shadow(color: .black, radius: 2)
//                            .padding(8)
//                    }
//                }
//            }
//            .navigationBarTitle("My Alarms")
//                .navigationBarItems(trailing: Button("Log out") {
//                    self.userInfo.isUserAuthenticated = .signedOut
//                    FBAuth.logout { (result) in
//                        print("Logged out")
//                    }
//                })
//                .onAppear {
//                    guard let uid = Auth.auth().currentUser?.uid else {
//                        return
//                    }
//                    FBFirestore.retrieveFBUser(uid: uid) { (result) in
//                        switch result {
//                        case .failure(let error):
//                            print(error.localizedDescription)
//                        case .success(let user):
//                            self.userInfo.user = user
//                        }
//                    }
//            }
//        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
