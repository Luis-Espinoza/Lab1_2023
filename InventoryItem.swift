//
//  InventoryItem.swift
//  Lab1_2023
//
//  Created by IMD 224 on 2023-02-07.
//

import SwiftUI

struct InventoryItem: Identifiable {
    let id = UUID()
    var image: String
    var description: String
    
    init(image: String, description: String) {
        self.image = image
        self.description = description
    }
}
