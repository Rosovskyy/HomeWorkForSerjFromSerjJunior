//
//  NoteManager.swift
//  HomeWorkForSerjFromSerj
//
//  Created by Serhii Rosovskyi on 17.03.2020.
//  Copyright © 2020 Serhii Rosovskyi. All rights reserved.
//

import SwiftUI

class NoteManager: ObservableObject {
    @Published var notes: [Note] = [
        Note(title: "Title 1", text: "Text 1", isFavorite: true, isDeleted: false, type: .later, createdAt: Date(), dueDate: nil),
        Note(title: "Title 2", text: "Text 2", isFavorite: false, isDeleted: false, type: .reminder, createdAt: Date(), dueDate: nil),
        Note(title: "Title 3", text: "Text 3", isFavorite: true, isDeleted: true, type: .todo, createdAt: Date(), dueDate: nil)
    ]
}
