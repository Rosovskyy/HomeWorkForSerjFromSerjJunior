//
//  ContentView.swift
//  HomeWorkForSerjFromSerj
//
//  Created by Serhii Rosovskyi on 15.03.2020.
//  Copyright © 2020 Serhii Rosovskyi. All rights reserved.
//

import SwiftUI
import FBSDKLoginKit
import Firebase

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State var presentingModal = false
    
    var body: some View {
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
                Button(action: {}) {
                  Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                }.sheet(isPresented: $presentingModal, content: {
                    MainTabView()
                })
                
                FacebookLoginButton()
                    .padding()
                    .frame(width: 330, height: 80)
                
                Button(action: {
                    self.presentingModal = true
                }) {
                    Text("Sign Up")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }.sheet(isPresented: $presentingModal, content: {
                    SignUpView(presentedAsModal: self.$presentingModal)
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FacebookLoginButton: UIViewRepresentable {
    
    func makeCoordinator() -> FacebookLoginButton.Coordinator {
        return FacebookLoginButton.Coordinator()
    }
    
    func makeUIView(context: UIViewRepresentableContext<FacebookLoginButton>) -> FacebookLoginButton.UIViewType {
        let button = FBLoginButton()
        button.delegate = context.coordinator
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        return button
    }
    
    func updateUIView(_ uiView: FBLoginButton, context: UIViewRepresentableContext<FacebookLoginButton>) {
        
    }
    
    class Coordinator: NSObject, LoginButtonDelegate {
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            
            if error != nil {
                print(error?.localizedDescription ?? "some error :((")
                return
            }
            
            if AccessToken.current != nil {
                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                
                Auth.auth().signIn(with: credential) { (res, err) in
                    if err != nil {
                        print(err?.localizedDescription ?? "some error :((")
                        return
                    }
                    
                    print("success")
                }
            }
            
        }
        
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            try! Auth.auth().signOut()
        }
    }
}
