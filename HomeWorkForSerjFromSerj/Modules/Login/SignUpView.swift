//
//  SignUpView.swift
//  HomeWorkForSerjFromSerj
//
//  Created by Serhii Rosovskyi on 15.03.2020.
//  Copyright © 2020 Serhii Rosovskyi. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @Binding var presentedAsModal: Bool
    
    var body: some View {
        Button("dismiss") { self.presentedAsModal = false }
    }
}
