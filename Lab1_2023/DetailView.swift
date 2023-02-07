//
//  ContentView.swift
//  Lab1_2023
//
//  Created by IMD 224 on 2023-01-10.
//

import SwiftUI

struct DetailView: View {
    @State private var description = ""
    @State private var favourite = false
    let defaultColor = Color.white
    let defaultFaveColor = Color.yellow
    var colour: Color
    var maxChars: Int
    
    @Binding var inventoryItem: InventoryItem
    
    var body: some View {
        VStack {
            Image(systemName: inventoryItem.image)
                .resizable(resizingMode: .stretch)
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .background(favourite ? colour : defaultColor)
                .accessibilityIdentifier("DetailImage")
            
            Toggle(isOn: $favourite) {
                Text("Favourite")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .accessibilityIdentifier("FavouriteToggle")
            }
            
            TextEditor(text: Binding(
                get: {
                    inventoryItem.description
                },
                set: {
                    newValue in
                    if newValue.count <= maxChars {
                        inventoryItem.description = newValue
                    }
                }
            )
            )
            .font(.title2)
            .fontWeight(.regular)
            .accessibilityIdentifier("DetailTextEditor")
            
            Text(String(description.count) + "/" + String(maxChars))
                .font(.title2)
                .fontWeight(.semibold)
                .accessibilityIdentifier("DetailText")
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    @State static var inventoryItems = InventoryItems()
    static var previews: some View {
        DetailView(colour: Color.yellow, maxChars: 150, inventoryItem: $inventoryItems.entries[0])
    }
}
