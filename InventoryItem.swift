//
//  InventoryItem.swift
//  Lab1_2023
//
//  Created by IMD 224 on 2023-02-07.
//

import SwiftUI

struct InventoryItem: Identifiable, Codable {
    var id = UUID()
    var image: UIImage {
        get {
            UIImage(data: self.imageAsData) ?? UIImage (systemName: "questionmark")!
        }
        set {
            self.imageAsData = newValue.pngData() ?? UIImage(systemName: "questionmark")!.pngData()!
        }
    }
    var imageAsData: Data
    var description: String
    var toggle: Bool
    
    init(image: String, description: String, toggle: Bool) {
        self.imageAsData = (UIImage(systemName: image) ?? UIImage(systemName: "questionmark")!).pngData()!
        self.description = description
        self.toggle = toggle
        
    }
    
    init(image: UIImage, description: String, toggle: Bool) {
        self.imageAsData = image.pngData() ?? UIImage(systemName: "questionmark")!.pngData()!
        self.description = description
        self.toggle = toggle
    }
}
