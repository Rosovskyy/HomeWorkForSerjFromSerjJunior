//
//  AddNewNoteView.swift
//  HomeWorkForSerjFromSerj
//
//  Created by Serhii Rosovskyi on 17.03.2020.
//  Copyright © 2020 Serhii Rosovskyi. All rights reserved.
//

import SwiftUI

struct AddNewNoteView: View {
    let noteManager: NoteManager
    
    @State var title        = ""
    @State var isFavorite   = false
    @State var text         = ""
    @State var type         = NoteType.todo
    @State private var selectedType = 0
    @State private var dueDate = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    var types = [NoteType.todo, NoteType.later, NoteType.reminder]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {
                    let note = Note(
                        title: self.title,
                        text: self.text,
                        isFavorite: self.isFavorite,
                        isDeleted: false,
                        type: self.types[self.selectedType],
                        createdAt: Date(),
                        dueDate: self.dueDate
                    )
                    
                    self.noteManager.notes.append(note)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Done")
                        .foregroundColor(Color.green)
                }
                .disabled(title.isEmpty && text.isEmpty)
            }
            
            TextField("Enter title here", text: $title)
            Toggle(isOn: $isFavorite) { Text("Favorite") }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Enter text here")
                    .multilineTextAlignment(.leading)
                TextView(text: $text)
                    .frame(width: UIScreen.main.bounds.width - 20, height: 50, alignment: .leading)
                    .border(Color.green)
            }
            
            Picker(selection: $selectedType, label: Text("Please choose a type")) {
               ForEach(0 ..< types.count) {
                    Text(self.types[$0].rawValue)
               }
            }
            
            VStack(alignment: .leading, spacing: 20, content: {
                Text("Choose some date")
                DatePicker(selection: $dueDate, in: ...Date(), displayedComponents: .date) {
                    Text("Select a date")
                }
            })
        }
        .padding()
    }
}
