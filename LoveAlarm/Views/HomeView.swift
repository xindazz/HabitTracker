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
    var body: some View {
        NavigationView {
            Text("Logged in as \(userInfo.user.name)")
            .navigationBarTitle("Firebase Loginnnnn")
                .navigationBarItems(trailing: Button("Log out") {
                    self.userInfo.isUserAuthenticated = .signedIn
                    FBAuth.logout { (result) in
                        print("Logged out")
                    }
                })
                .onAppear {
                    guard let uid = Auth.auth().currentUser?.uid else {
                        return
                    }
                    FBFirestore.retrieveFBUser(uid: uid) { (result) in
                        switch result {
                        case .failure(let error):
                            print(error.localizedDescription)
                        case .success(let user):
                            self.userInfo.user = user
                        }
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
