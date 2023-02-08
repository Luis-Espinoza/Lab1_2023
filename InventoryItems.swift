//
//  InventoryItems.swift
//  Lab1_2023
//
//  Created by IMD 224 on 2023-02-07.
//

import SwiftUI
import os

class InventoryItems: ObservableObject {
    @Published var entries = [InventoryItem]()
    
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in : .userDomainMask).first!
    static let entriesURL = documentsDirectory.appendingPathComponent("entries")
    
    init(previewMode: Bool) {
        if previewMode {
            entries.append(InventoryItem(image: "hare", description: "Hare", toggle: false))
            entries.append(InventoryItem(image: "tortoise", description: "Tortoise", toggle: false))
        }
    }
    
    init() {
        loadObjects()
    }
    
    func loadObjects() {
        do{
            let data = try Data(contentsOf: InventoryItems.entriesURL)
            let decoder = JSONDecoder()
            entries = try decoder.decode([InventoryItem].self, from: data)
        } catch {
            os_log("Cannot load due to %@", log: OSLog.default, type: .debug, error.localizedDescription)
        }
    }
    
    func saveObjects() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(entries)
            try data.write(to: InventoryItems.entriesURL)
        } catch {
            os_log("Cannot save due to %@", log: OSLog.default, type: .debug, error.localizedDescription)
        }
    }
}
