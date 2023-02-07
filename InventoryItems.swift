//
//  InventoryItems.swift
//  Lab1_2023
//
//  Created by IMD 224 on 2023-02-07.
//

import SwiftUI

class InventoryItems: ObservableObject {
    @Published var entries: [InventoryItem]
    
    init() {
        entries = [InventoryItem]()
        entries.append(InventoryItem(image: "hare", description: "Hare"))
        entries.append(InventoryItem(image: "tortoise", description: "Tortoise"))
    }
}
