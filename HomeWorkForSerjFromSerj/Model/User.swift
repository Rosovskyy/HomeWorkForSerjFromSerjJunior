//
//  User.swift
//  HomeWorkForSerjFromSerj
//
//  Created by Serhii Rosovskyi on 25.03.2020.
//  Copyright © 2020 Serhii Rosovskyi. All rights reserved.
//

import Foundation


class User: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var imageURL: URL = URL(string: "https://rlv.zcache.com/broken_internet_image_icon_postcard-r579d1199998a41e7a349e8d3a5b1b8d7_vgbaq_8byvr_324.jpg")!
}
