//
//  SignUpView.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-19.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showError = false
    @State private var errorString = ""
    
    @State private var nameFooter = ""
    @State private var emailFooter = ""
    @State private var passFooter1 = ""
    @State private var passFooter2 = ""
    
    let Color1 = Color(red: 0.2, green: 0.6, blue: 0.5, opacity: 1)
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(footer: Text(user.validNameText).font(.caption).foregroundColor(.red)) {
                        TextField("Your Name", text: self.$user.username).autocapitalization(.words)
                    }
                    Section(footer: Text(user.validEmailAddressText).font(.caption).foregroundColor(.red)) {
                        TextField("Email Address", text: self.$user.email).autocapitalization(.none).keyboardType(.emailAddress)
                    }
                    Section(footer: Text(user.validPasswordText).font(.caption).foregroundColor(.red)) {
                        SecureField("Password", text: self.$user.password)
                    }
                    Section(footer: Text(user.validConfirmPasswordText).font(.caption).foregroundColor(.red)) {
                        SecureField("Confirm Password", text: self.$user.confirmPassword)
                    }
                }
                Spacer()
                VStack() {
                    Button(action: {
                        FBAuth.createUser(withEmail: self.user.email, name: self.user.username, password: self.user.password) { (result) in
                            switch result {
                            case .failure(let error):
                                self.errorString = error.localizedDescription
                                self.showError = true;
                            case .success(_):
                                print("Account creation successful")
                            }
                        }
                    }) {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                            .background(Color(UIColor.secondarySystemBackground))
                            .foregroundColor(Color1)
                            .cornerRadius(5)
                            .shadow(color: .black, radius: 2)
                            .opacity(user.isSignUpComplete ? 1 : 0.5)
                    }
                    .disabled(!user.isSignUpComplete)
                }.padding()
            }.padding(.top)
                .alert(isPresented: $showError) {
                    Alert(title: Text("Error creating account"), message: Text(self.errorString), dismissButton: .default(Text("OK")))
            }
                .navigationBarTitle("Sign Up", displayMode: .inline)
                .navigationBarItems(trailing: Button("Dismiss") {
                    self.presentationMode.wrappedValue.dismiss()
                })
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
