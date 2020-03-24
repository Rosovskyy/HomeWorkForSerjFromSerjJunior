//
//  FacebookLoginButton.swift
//  HomeWorkForSerjFromSerj
//
//  Created by Serhii Rosovskyi on 15.03.2020.
//  Copyright © 2020 Serhii Rosovskyi. All rights reserved.
//

import SwiftUI
import FBSDKLoginKit
import Firebase

struct FacebookLoginButton: UIViewRepresentable {
    
    func makeCoordinator() -> FacebookLoginButton.Coordinator {
        return FacebookLoginButton.Coordinator()
    }
    
    func makeUIView(context: UIViewRepresentableContext<FacebookLoginButton>) -> FBLoginButton {
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
