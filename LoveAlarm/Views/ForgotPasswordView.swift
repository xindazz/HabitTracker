//
//  ForgotPasswordView.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-19.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var user: UserViewModel = UserViewModel()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter email address", text: $user.email).autocapitalization(.none).keyboardType(.emailAddress)
                Button(action: {
                    // Reset Password action
                }) {
                    Text("Reset")
                        .frame(width: 200)
                        .padding(.vertical, 15)
                        .background(Color.green)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .opacity(user.isEmailValid(_email: user.email) ? 1 : 0.75)
                }
                .disabled(!user.isEmailValid(_email: user.email))
                Spacer()
            }.padding(.top)
                .frame(width: 300)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            .navigationBarTitle("Request a password reset", displayMode: .inline)
                .navigationBarItems(trailing: Button("Dismiss") {
                    self.presentationMode.wrappedValue.dismiss()
                })
        }
    }
}


struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
