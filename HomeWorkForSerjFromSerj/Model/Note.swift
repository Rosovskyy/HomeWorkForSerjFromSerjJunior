//
//  Not.swift
//  HomeWorkForSerjFromSerj
//
//  Created by Serhii Rosovskyi on 17.03.2020.
//  Copyright © 2020 Serhii Rosovskyi. All rights reserved.
//

import SwiftUI
import CoreData

struct Note: Identifiable {
    let id = UUID()
    let title: String
    let text: String
    let isFavorite: Bool
    let isDeleted: Bool
    let type: NoteType
    let createdAt: Date
    let dueDate: Date?
}
