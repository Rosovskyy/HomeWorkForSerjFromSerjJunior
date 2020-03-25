//
//  NoteListView.swift
//  HomeWorkForSerjFromSerj
//
//  Created by Serhii Rosovskyi on 17.03.2020.
//  Copyright © 2020 Serhii Rosovskyi. All rights reserved.
//

import SwiftUI

struct NotesListView: View {
    @ObservedObject var noteManager: NoteManager
    @State private var shouldShowSheet = false
    var chosenTab: ChosenTab = .all
    var notes = [Note]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(chosenTab == .all ? noteManager.notes : chosenTab == .favorites ? noteManager.notes.filter { $0.isFavorite } : noteManager.deletedNotes) { note in
                    NoteRowView(note: note)
                }
               .onMove(perform: move(from:to:))
               .onDelete(perform: delete(for:))
            }
            .navigationBarItems(
                trailing: HStack {
                    if chosenTab == .all {
                        Button(
                            action: {
                                self.shouldShowSheet.toggle()
                            },
                            label: {
                                Text("Add")
                            }
                        )
                        .sheet(isPresented: $shouldShowSheet) {
                            AddNewNoteView(noteManager: self.noteManager)
                        }
                        
                        Spacer()
                            .frame(width: 25.0)
                    }
                    
                    EditButton()
                }
            ).navigationBarTitle(chosenTab == .all ? "All Notes" : chosenTab == .favorites ? "Favorite Notes" : "Deleted Notes")
        }
        .padding()
    }
    
    func delete(for offset: IndexSet) {
        if chosenTab != .deleted {
            noteManager.notes[offset.first ?? 0].isDeleted = true
            noteManager.deletedNotes.append(noteManager.notes[offset.first ?? 0])
            noteManager.notes.remove(atOffsets: offset)
        } else {
            noteManager.deletedNotes.remove(atOffsets: offset)
        }
    }
    
    func move(from offset: IndexSet, to index: Int) {
        noteManager.notes.move(fromOffsets: offset, toOffset: index)
    }
}
