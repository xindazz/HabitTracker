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
    
    @State private var showSignUp = false;
    
    var body: some View {
        
        SignInView(showSignUp: $showSignUp)
            .sheet(isPresented: $showSignUp) {
                SignUpView()
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
