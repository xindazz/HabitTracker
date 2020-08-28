//
//  SignInWithEmailView.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-19.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Binding var showSignUp: Bool
    
    @State private var showAlert = false;
    @State private var authError: EmailAuthError?

    let Color1 = Color(red: 0.2, green: 0.6, blue: 0.5, opacity: 1)
    
    var body: some View {
        NavigationView{
            //LinearGradient(gradient: Gradient(colors: [.blue, .gray]), startPoint: .top, endPoint: .bottom)
            VStack{
                Form{
                    Section(header: Text("Enter your email address")){
                        TextField("123@gmail.com", text: self.$user.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .padding(12)
                    }
                    Section(header: Text("Enter your password")){
                        SecureField("Password", text: self.$user.password)
                        .padding(12)
                    }
                }
                HStack (spacing: 60){
                    Button(action: {
                        print("SignUp button was tapped")
                        self.showSignUp = true;
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
                        FBAuth.authenticate(withEmail: self.user.email, password: self.user.password) { (result) in
                            switch result {
                            case .failure(let error):
                                self.authError = error
                                self.showAlert = true
                            case .success(_):
                                print("Signed in")
                                self.userInfo.isUserAuthenticated = .signedIn
                            }
                        }
                    }) {
                        Text("Log In")
                            .fontWeight(.semibold)
                            .background(Color(UIColor.secondarySystemBackground))
                            .foregroundColor(Color1)
                            .cornerRadius(5)
                            .shadow(color: .black, radius: 2)
                            .padding(10)
                            .opacity(user.isSignInComplete ? 1 : 0.5)
                    }.disabled(!user.isSignInComplete)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Error"), message: Text(self.authError?.localizedDescription ?? "Unknown error"), dismissButton: .default(Text("Ok")) {
                    if self.authError == .incorrectPassword {
                        self.user.password = ""
                    } else {
                        self.user.password = ""
                        self.user.email = ""
                    }
                })
            }
        .navigationBarTitle(Text("Start Your Alarm Journey now!"), displayMode: .inline)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(showSignUp: .constant(false))
    }
}
