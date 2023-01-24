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
    var body: some View {
        VStack {
            Image(systemName: "tortoise.fill")
                .resizable(resizingMode: .stretch)
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .background(favourite ? colour : defaultColor)
            
            Toggle(isOn: $favourite) {
                Text("Favourite")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            TextEditor(text: Binding(
                get: {
                    description
                },
                set: {
                    newValue in
                    if newValue.count <= maxChars {
                        description = newValue
                    }
                }
            )
            )
            .font(.title2)
            .fontWeight(.regular)
            
            Text(String(description.count) + "/" + String(maxChars))
                .font(.title2)
                .fontWeight(.semibold)
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(colour: Color.yellow, maxChars: 150)
    }
}
