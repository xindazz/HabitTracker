//
//  ContentView.swift
//  KTsLoveAlarm
//
//  Created by KT Chen on 8/28/20.
//  Copyright © 2020 KT Chen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var alarmTitle = ""
    @State private var friendPicked = ""
    @State private var songChosen = ""
    @State private var wakeUp = Date()
    @State private var done = false
    
    var body: some View {
        NavigationView{
            VStack(spacing:0){
                Form{
                    Section(header: Text("Give a Title to your alarm")){
                        TextField("Enter Title", text: $alarmTitle)
                        .padding(9)
                    }
                    Section(header: Text("Please enter a time")){
                        DatePicker("", selection: $wakeUp, in: Date()...)
                        .padding(9)
                    }
                    Section(header: Text("Whose alarm is this")){
                        TextField("Pick a Friend", text: $friendPicked)
                        .padding(9)
                    }
                    Section(header: Text("Customise sound")){
                        TextField("Choose from", text: $songChosen)
                        .padding(9)
                    }
                }
            }
            .navigationBarTitle("Set Alarms")
            .navigationBarItems(trailing: Button(action: {
             // button activates link
              self.done = true
            }) {
            Text("Done")
                .padding(6)
                .foregroundColor(.blue)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
