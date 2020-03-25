//
//  ProfileView.swift
//  HomeWorkForSerjFromSerj
//
//  Created by Serhii Rosovskyi on 24.03.2020.
//  Copyright © 2020 Serhii Rosovskyi. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var noteManager: NoteManager
    @ObservedObject var user: User
    
    var body: some View {
        VStack {
            AsyncImage(
                url: user.imageURL,
                placeholder: Text("Loading ...")
                )
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .center)
            
            Text("Email: \(user.email.isEmpty ? "No email" : user.email)")
            Text("Name: \(user.name.isEmpty ? "No name" : user.name)")
            Text("Number of notes: \(noteManager.notes.count)")
            Text("Number of favorite notes: \(noteManager.notes.filter { $0.isFavorite }.count)")
            Text("Number of deleted notes: \(noteManager.deletedNotes.count)")
        }
    }
}

