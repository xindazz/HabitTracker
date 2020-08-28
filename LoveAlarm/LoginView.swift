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
    var body: some View {
        Button("Login") {
            self.userInfo.isUserAuthenticated = .signedIn
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
