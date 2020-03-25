//
//  ContentView.swift
//  HomeWorkForSerjFromSerj
//
//  Created by Serhii Rosovskyi on 15.03.2020.
//  Copyright © 2020 Serhii Rosovskyi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var presentingSignUp = false
    @State private var presentingMainTab = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("The best app ever")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .padding([.top, .bottom], 40)
                    
                Image("iosIcon")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.bottom, 50)
                        
                VStack(alignment: .leading, spacing: 15.0) {
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20.0)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20.0)
                }.padding([.leading, .trailing], 27.5)
                        
                VStack(alignment: .center, spacing: 7.0) {
                    NavigationLink(destination: MainTabView(), label: {
                        Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                    }).disabled(email.isEmpty && password.isEmpty)
                            
                    FacebookLoginButton()
                        .padding()
                        .frame(width: 330, height: 80)
                            
                    Button(action: {
                        self.presentingSignUp.toggle()
                    }) {
                        Text("Sign Up")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }.sheet(isPresented: $presentingSignUp, content: {
                        SignUpView(presentedAsModal: self.$presentingSignUp)
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
