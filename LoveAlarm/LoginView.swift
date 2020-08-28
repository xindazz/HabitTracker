//
//  LoginView.swift
//  LoveAlarm
//
//  Created by Xinda on 8/26/20.
//  Copyright © 2020 Xinda Zhou. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userInfo:UserInfo
    
    @State private var username = ""
    @State private var password = ""
    let Color1 = Color(red: 0.2, green: 0.6, blue: 0.5, opacity: 1)
    
    var body: some View {
        NavigationView{
            //LinearGradient(gradient: Gradient(colors: [.blue, .gray]), startPoint: .top, endPoint: .bottom)
            VStack{
                Form{
                    Section(header: Text("Enter a unique username as your ID")){
                        TextField("Username", text: $username)
                        .padding(12)
                    }
                    Section(header: Text("Must include both numbers and characters")){
                        TextField("Password", text: $password)
                        .padding(12)
                    }
                    //need to update the username and password into the database
                }
                HStack (spacing: 60){
                    Button(action: {
                        print("SignUp button was tapped")
                    }) {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                            .background(Color(UIColor.secondarySystemBackground))
                            .foregroundColor(Color1)
                            .cornerRadius(5)
                            .shadow(color: .black, radius: 2)
                            .padding(10)
                    }
                    Button(action: {
                        print("SignIn button was tapped")
                        self.userInfo.isUserAuthenticated = .signedIn
                    }) {
                        Text("Sign In")
                            .fontWeight(.semibold)
                            .background(Color(UIColor.secondarySystemBackground))
                            .foregroundColor(Color1)
                            .cornerRadius(5)
                            .shadow(color: .black, radius: 2)
                            .padding(10)
                    }
                }
            }
        .navigationBarTitle(Text("Start Your Alarm Journey now!"), displayMode: .inline)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
