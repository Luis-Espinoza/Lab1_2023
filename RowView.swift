//
//  RowView.swift
//  Lab1_2023
//
//  Created by IMD 224 on 2023-02-07.
//

import SwiftUI

struct RowView: View {
    var inventoryItem: InventoryItem
    let defaultColor = Color.white
    var colour: Color
    
    var body: some View {
        HStack {
            Image(uiImage: inventoryItem.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .leading)
                .background(inventoryItem.toggle ? colour : defaultColor)
            Text(inventoryItem.description)
                .frame(width: 200, height: 100, alignment: .leading)
        }
        .padding()
    }
}

struct RowView_Previews: PreviewProvider {
    static var inventoryItems = InventoryItems(previewMode: true)
    static var previews: some View {
        RowView( inventoryItem: inventoryItems.entries[0], colour: Color.yellow)
    }
}
