//
//  NoteRowView.swift
//  HomeWorkForSerjFromSerj
//
//  Created by Serhii Rosovskyi on 17.03.2020.
//  Copyright © 2020 Serhii Rosovskyi. All rights reserved.
//

import SwiftUI

struct NoteRowView: View {
    let note: Note
    
    var body: some View {
        HStack {
            Text(note.title)
            
            Spacer()
                .frame(width: 50.0)
            
            Text(note.text)
            
            Text(note.type.rawValue)
                        
            Spacer()
            
            if note.isFavorite {
                Image(systemName: "star.fill")
            }
        }
    }
}
