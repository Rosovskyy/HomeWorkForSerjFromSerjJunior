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
    
    var body: some View {
        VStack {
            Text("Number of notes: \(noteManager.notes.count)")
            Text("Number of favorite notes: \(noteManager.notes.filter { $0.isFavorite }.count)")
            Text("Number of deleted notes: \(noteManager.deletedNotes.count)")
        }
    }
}

