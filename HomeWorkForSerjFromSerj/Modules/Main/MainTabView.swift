//
//  MainTabView.swift
//  HomeWorkForSerjFromSerj
//
//  Created by Serhii Rosovskyi on 15.03.2020.
//  Copyright © 2020 Serhii Rosovskyi. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var noteManager = NoteManager()
        
    var body: some View {
        TabView {
            NotesListView(noteManager: noteManager, chosenTab: .all)
                .tabItem {
                    Text("Notes")
                    Image(systemName: "1.square.fill")
                }
            NotesListView(noteManager: noteManager, chosenTab: .favorites)
                .tabItem {
                    Text("Favorite")
                    Image(systemName: "2.square.fill")
                }
            NotesListView(noteManager: noteManager, chosenTab: .deleted)
                .tabItem {
                    Text("Deleted")
                    Image(systemName: "3.square.fill")
                }
            
            ProfileView(noteManager: noteManager)
                .tabItem {
                    Text("Profile")
                    Image(systemName: "4.circle.fill")
                }
        }.navigationBarBackButtonHidden(true)
    }
}
