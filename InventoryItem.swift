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
    var toggle: Bool
    
    init(image: String, description: String, toggle: Bool) {
        self.image = image
        self.description = description
        self.toggle = toggle
    }
}
