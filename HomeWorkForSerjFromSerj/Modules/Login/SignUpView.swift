//
//  SignUpView.swift
//  HomeWorkForSerjFromSerj
//
//  Created by Serhii Rosovskyi on 15.03.2020.
//  Copyright © 2020 Serhii Rosovskyi. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @Binding var presentedAsModal: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {

        VStack(alignment: .leading, spacing: 15.0) {
            TextField("Email", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(20.0)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(20.0)
            
            SecureField("Confirm password", text: $confirmPassword)
                .padding()
                .background(Color.white)
                .cornerRadius(20.0)
            
            Button("Done") { self.presentedAsModal = false }.disabled(email.isEmpty || password.isEmpty || confirmPassword.isEmpty || (password != confirmPassword))
            Button("Dissmiss") { self.presentedAsModal = false }
        }.padding([.leading, .trailing], 27.5)
    }
}
